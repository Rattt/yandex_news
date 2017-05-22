require 'sidekiq/web'

Rails.application.routes.draw do
  root 'articles#last_active'
  get '/admin', to: 'articles#edit'
  post '/admin', to: 'articles#create'
  patch '/admin', to: 'articles#update'

  mount Sidekiq::Web => '/sidekiq'
end
