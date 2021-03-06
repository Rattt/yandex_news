# yandex_news
Show main yandex news on all opened pages

Реализуйте web-приложение (Rails проект), которое состоит из двух страниц: / и /admin. На странице / отображается первая главная новость из ленты Яндекса. Новость выводится в свободном виде, содержит дату, заголовок и аннотацию. Приложение фоновым скриптом периодически обновляет текущую главную новость. При обновлении главной новости в приложении она обновляется на всех открытых в текущий момент страницах /.
На странице /admin находится форма для ввода авторской новости. На форме расположены поле для ввода заголовка, поле для ввода аннотации, поле для ввода даты-времени и сабмит. Форма содержит разумные валидации. При сабмите авторская новость становится главной до наступления заданного времени. Т.е. до этого времени прочие новости игнорируются, вместо них на страницах / выводится авторская новость. Временем создания авторской новости считается время сабмита формы. Если существует действующая авторская новость, страница /admin загружается с уже заполненными полями. При сабмите авторской новости она, конечно же, сразу обновляется на всех открытых страницах /. При истечении времени действия авторской новости на всех страницах начинает отображаться актуальная на данный момент главная новость из ленты Яндекса.

Web-приложение должно корректно работать в браузерах IE и Chrome последних версий. Код должен быть покрыт тестами. Плюсом будет использование какого-либо JS-фреймворка на клиентской стороне, аккуратный внешний вид приложения.
Все необходимое для локального запуска приложения должно быть оформлено в виде Procfile-а для Foreman или в виде Dockerfile-а.


## Installation
1. Install **Redis**
2. Change **REDIS_URL** in **yandex_news/.env**
3. Install missing gems: ```$ bundle install```
4. Create *cron* task which will download yandex articles via ```$ whenever --update-crontab```

### Commands and links
- Run the app: ```$ foreman start```
- Run all tests: `rails t`
- Update *cron* task after changes in *config/schedule.rb*: ```$ whenever --update-crontab```
- Sidekiq dashboard: `http://yandex_news:3000/sidekiq`

## Flaws
- парсинг страниц яндекса вместо rss
- сервисы используются очень странно, как простейший прокси к библиотечным методам, при этом вся логика распределена по моделям и фоновым задачам
- тестам для работы нужен доступ в сеть
