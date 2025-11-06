# 1. Определяем базовый образ
FROM debian:11

# 2. Устанавливаем nginx
RUN apt-get update && apt-get install -y nginx

# 3. Создаем дирректорию
RUN mkdir -p /opt/www/

# 4. Копируем файл с тестовой страницей для задания
COPY ./index.html /opt/www/

# 5. Копируем файл с конфигурацией nginx, чтобы работала наша страница
COPY ./lesson16 /etc/nginx/sites-available/

# 6. Включаем наш сайт
RUN ln -s /etc/nginx/sites-available/lesson16 /etc/nginx/sites-enabled/

# 7. Выключаем сайт по умолчанию
RUN rm /etc/nginx/sites-enabled/default

# 8. Откроем 80 порт для нашего контейнера
EXPOSE 80

# 9. Запускаем nginx на переднем плане
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]