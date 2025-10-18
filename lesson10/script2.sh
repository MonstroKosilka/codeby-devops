#!/bin/bash

#Путь к папке с которой будем работать
DIR="$HOME/myfolder"

#Проверка, что есть папка с которой будем работать
if [ -d "$DIR" ]; then
	#Считаем количество файлов в целевой директории
	files_count=$(ls -1 "$DIR" | wc -l)
	echo "В директории $DIR существует $files_count файлов"

	#Изменяем права для второго файла
	if [ -f "$DIR/file2" ]; then
		chmod 664 $DIR/file2
	fi

	#Удаление пустых файлов
	find "$DIR" -type f -empty -delete

	#Удаление всех строк кроме первой в оставщихся файлах
	for entry in "$DIR"/*
	do
		head -1 "$entry" > "$entry.tmp" && mv "$entry.tmp" "$entry"
	done
else
	echo "Папка $DIR не существует"
fi
