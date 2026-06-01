# Настройки для docker под laravel
### Устанавливается сервисы:
- nginx
- php
- - xdebug
- mysql
- phpmyadmin

---

## Быстрые команды для этого проекта (Windows PowerShell)

Примечание: в PowerShell не используйте `&&` в одной строке, выполняйте команды по очереди или разделяйте `;`.

1) Запуск стека (сборка, запуск в фоне):
   docker-compose up -d --build

2) Остановка и удаление контейнеров (не удаляет тома):
   docker-compose down

3) Остановка и удаление вместе с томами (ОСТОРОЖНО — удаляет данные БД):
   docker-compose down --volumes

4) Список контейнеров и статусы:
   docker ps -a

5) Просмотр логов (пример для nginx):
   docker-compose logs -f nginx

6) Работа с composer (через composer-контейнер):
   - Установить пакет: docker-compose run --rm composer require vendor/package
   - Установить dev-пакет: docker-compose run --rm composer require --dev vendor/package
   - Установить зависимости (после правки composer.json): docker-compose run --rm composer install
   - Если сервис composer уже запущен: docker-compose exec composer require vendor/package

7) Использование artisan (есть сервис artisan):
   - Запуск команды временным контейнером: docker-compose run --rm artisan <command>
     Примеры:
       docker-compose run --rm artisan migrate
       docker-compose run --rm artisan migrate:fresh --seed
       docker-compose run --rm artisan tinker
       docker-compose run --rm artisan make:controller Api/ExampleController
       docker-compose run --rm artisan make:filament-user --name="Admin" --email=admin@example.com --password="secret"

   - Если контейнер php запущен, можно через него: docker-compose exec php php artisan <command>

8) Права и владелец (если ошибки с записью в storage или bootstrap/cache):
   docker-compose exec php sh -c "chown -R www-data:www-data /var/www/laravel/storage /var/www/laravel/bootstrap/cache && chmod -R 775 /var/www/laravel/storage /var/www/laravel/bootstrap/cache"

9) MySQL / phpMyAdmin
   - phpMyAdmin доступен по порту: http://localhost:8080 (используйте учётные из env/mysql.env)
   - Перезапустить только mysql: docker-compose up -d mysql

10) Фронтенд (npm / Vite)
   - На хосте (если установлен node/npm): в папке ./src
       npm install
       npm run dev   # для разработки
       npm run build # для продакшн

11) Полезные команды диагностики
   - Просмотреть тома: docker volume ls
   - Инспект тома: docker volume inspect <volume_name>
   - Выполнить оболочку в контейнере php: docker-compose exec php sh

---

Если хотите, я могу добавить в README инструкции по установке Filament/созданию администратора или настроить автоматические права при старте контейнера.
