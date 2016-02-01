Rails.application.configure do
  config.action_controller.asset_host = ENV.fetch("ASSET_HOST", ENV.fetch("HOST"))
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.action_mailer.raise_delivery_errors = false
  config.i18n.fallbacks = true
  config.log_formatter = ::Logger::Formatter.new
  config.log_level = :debug
  config.active_support.deprecation = :log
  config.active_record.dump_schema_after_migration = false
  config.assets.compile = false
  config.assets.digest = true
  config.assets.js_compressor = :uglifier
  config.action_mailer.default_url_options = { host: ENV.fetch("HOST"), port: 3000 }
  config.serve_static_files = ENV["RAILS_SERVE_STATIC_FILES"].present?
end
Rails.application.routes.default_url_options[:host] = ENV.fetch("HOST")
Rack::Timeout.timeout = (ENV["RACK_TIMEOUT"] || 20).to_i
