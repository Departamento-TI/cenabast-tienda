require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SpreeStarter
  class Application < Rails::Application
    config.to_prepare do
      # Load application's model / class decorators
      Dir.glob(File.join(File.dirname(__FILE__), '../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      # Load application's view overrides
      Dir.glob(File.join(File.dirname(__FILE__), '../app/overrides/*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

        # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.active_record.yaml_column_permitted_classes = [Symbol, BigDecimal]

    config.time_zone = 'Santiago'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en

    # use Sidekiq for ActiveJob
    config.active_job.queue_adapter = :sidekiq

    # adds support for Services
    config.autoload_paths += %W(#{config.root}/services #{config.root}/app/services/concerns)

    # https://viewcomponent.org/guide/testing.html
    # Add viewcomponent preview paths to be used for testing
    # purposes
    config.view_component.preview_paths << "#{Rails.root}/spec/components/previews"

    if Rails.env.production?
      # CloudFlare middleware for proper visitors IP addresses
      require "#{Rails.root}/lib/cloud_flare_middleware"
      config.middleware.insert_before(0, Rack::CloudFlareMiddleware)
    end

    # SMTP mail
    if ENV['SMTP_USERNAME'].present?
      config.action_mailer.delivery_method = :smtp
      config.action_mailer.smtp_settings = {
        address:              ENV["SMTP_ADDRESS"],
        port:                 ENV["SMTP_PORT"].to_i,
        domain:               ENV["SMTP_DOMAIN"],
        user_name:            ENV["SMTP_USERNAME"],
        password:             ENV["SMTP_PASSWORD"],
        authentication:       ENV["SMTP_AUTH"] || 'plain',
        enable_starttls_auto: ENV["SMTP_ENABLE_STARTTLS_AUTO"] == "true"
      }
    end
  end
end
