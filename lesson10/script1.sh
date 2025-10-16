#!/bin/bash

#Путь для рабочей папки
DIR="$HOME/myfolder/"

#Чтобы не было конфликта с содержимым папки удалим её с содержимым
if [ -d "$DIR" ]; then
	rm -r $DIR
fi

#Создаём папку
mkdir $DIR

#Создание первого файла
echo "Приветствую!!" > $DIR/file1
date >> $DIR/file1

#Создание второго файла
touch $DIR/file2
chmod 777 $DIR/file2

#Создание третьего файла
RANDOM_STRING=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 20)
echo "$RANDOM_STRING" > $DIR/file3

#Создание четвертого и пятого файлов
touch $DIR/file4
touch $DIR/file5
