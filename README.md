# yandex_news
Show main yandex news on all opened pages

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
