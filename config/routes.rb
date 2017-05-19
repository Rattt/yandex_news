require 'sidekiq/web'

Rails.application.routes.draw do
  root 'articles#last_active'

  mount Sidekiq::Web => '/sidekiq'
end
