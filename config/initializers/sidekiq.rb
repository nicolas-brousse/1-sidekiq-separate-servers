Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://10.10.150.10:7379/12' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://10.10.150.10:7379/12' }
end
