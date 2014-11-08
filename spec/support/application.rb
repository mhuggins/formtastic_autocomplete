module TestApp
  class Application < ::Rails::Application
    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = 'utf-8'
    config.active_support.deprecation = :stderr
    config.secret_key_base = 'secret'
    config.eager_load = false
  end
end

TestApp::Application.initialize!
