#!/bin/bash

#***********************************************************#
#						script2.sh							#
#					author: MonstroKosilka   				#
#						22.10.2025							#
#															#
#		      Удаление файлов в папке myfolder    			#
#				     Версия для ДЗ №11         				#
#***********************************************************#

#Путь к папке с которой будем работать
DIR="$HOME/myfolder"

#Проверка, что есть папка с которой будем работать
if [ -d "$DIR" ]; then
	#Считаем количество файлов в целевой директории
	files_count=$(find "$DIR" -maxdepth 1 -type f | wc -l)
	echo "В директории $DIR существует $files_count файлов"

	#Изменяем права для второго файла
	if [ -f "$DIR/file2" ]; then
		chmod 664 "$DIR/file2"
	fi

	#Удаление пустых файлов
	find "$DIR" -type f -empty -delete

	#Удаление всех строк кроме первой в оставшихся файлах
	for entry in "$DIR"/*
	do
		head -1 "$entry" > "$entry.tmp" && mv "$entry.tmp" "$entry"
	done
else
	echo "Папка $DIR не существует"
fi
