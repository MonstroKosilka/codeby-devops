# 1. Определяем базовый образ
FROM alpine:latest

# 2. Устанавливаем nginx
RUN apk add --no-cache nginx

# 3. Создаем дирректорию
RUN mkdir -p /opt/www/

# 4. Копируем файл с тестовой страницей для задания
COPY ./index.html /opt/www/

# 5. Копируем файл с конфигурацией nginx, чтобы работала наша страница
COPY ./nginx.conf /etc/nginx/nginx.conf

# 6. Откроем 80 порт для нашего контейнера
EXPOSE 80

# 7. Запускаем nginx на переднем плане
CMD [ "nginx", "-g", "daemon off;" ]