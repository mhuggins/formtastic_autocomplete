module FormtasticAutocomplete
  module Rails
    class Engine < ::Rails::Engine
      initializer 'formtastic_autocomplete.assets.precompile' do |app|
        %w(stylesheets javascripts).each do |dir|
          app.config.assets.paths << root.join('assets', dir)
        end
      end
    end
  end
end
