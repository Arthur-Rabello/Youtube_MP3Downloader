require_relative "application"

Rails.application.initialize!

Rails.application.configure do
  config.cache_store = :redis_cache_store, { url: Rails.application.credentials.dig(:redis, :url) }
end
