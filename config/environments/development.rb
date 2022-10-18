require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.action_mailer.raise_delivery_errors = false
  host = 'localhost:3000' # Don't use this literally; use your local dev host instead
  config.action_mailer.default_url_options = { host: host, protocol: 'http' }
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  # config.i18n.available_locales = ['es-CO', :de]

  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true
    config.cache_store = :null_store
  end

  config.active_storage.service = :local
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.assets.debug = true
  config.assets.quiet = true
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  config.action_mailer.delivery_method = :smtp
end
