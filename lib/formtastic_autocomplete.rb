require_relative 'formtastic_autocomplete/version'
require_relative 'formtastic/inputs/autocomplete_input'

module FormtasticAutocomplete
  class << self
    def load!
      register_rails_engine if rails?
    end

    private

    def register_rails_engine
      require_relative 'formtastic_autocomplete/engine'
    end

    def rails?
      defined?(::Rails)
    end
  end
end

FormtasticAutocomplete.load!
