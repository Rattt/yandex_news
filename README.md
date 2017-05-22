# yandex_news
Show main yandex news on all opened pages

## Sidekiq for backgroud jobs
Run `$ bundle exec sidekiq` in rails root folder to enable backgroud processing.
Sidekiq depends on **Redis**.

## Crontab
Run `$ whenever --update-crontab` in rails root folder to update crontab.
Depends on **Sidekiq**.
