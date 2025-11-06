# 1. Сборка
FROM python:3.9 AS builder

WORKDIR /app

# 2. Копируем requirements.txt
COPY requirements.txt .

# 3. Устанавливаем зависимости в отдельную директорию
RUN pip install --target /app/packages -r requirements.txt

# 4. Запуск
FROM python:3.9-slim

WORKDIR /app

# 5. Копируем установленные зависимости
COPY --from=builder /app/packages /app/packages

# 6. Копируем исходный код приложения
COPY . .

# 7. Устанавливаем переменные окружения
ENV PYTHONPATH=/app/packages
ENV FLASK_APP=server.py
ENV FLASK_ENV=development

# 8. Открываем порт
EXPOSE 5000

# 9. Команда запуска приложения
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]