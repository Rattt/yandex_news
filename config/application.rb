require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module YandexNews
  class Application < Rails::Application
    config.load_defaults 5.1

    config.active_job.queue_adapter = :sidekiq

    config.i18n.available_locales = [:en, :ru]
    config.i18n.default_locale = :ru
  end
end
