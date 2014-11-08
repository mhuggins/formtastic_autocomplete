require 'active_support/core_ext/hash/deep_merge'

module Formtastic
  module Inputs
    class AutocompleteInput < StringInput
      def to_html
        input_wrapping do
          label_html <<
          builder.text_field(method, input_html_options) <<
          builder.hidden_field(method, hidden_html_options)
        end
      end

      private

      def input_html_options
        {
            class: 'autocomplete'
        }.merge(super).deep_merge(
            name:  '',
            id:    options.key?(:input_html) && options[:input_html].key?(:id) ? options[:input_html][:id] : input_tag_id,
            value: options.key?(:value) ? options[:value] : input_tag_value,
            data:  { source: options[:source] }
        )
      end

      def hidden_html_options
        {
            value: options.key?(:value) ? options[:value] : hidden_tag_value
        }
      end

      def input_tag_id
        "#{sanitized_object_name}_#{sanitized_method}_autocomplete"
      end

      def input_tag_value
        return unless association

        if association.respond_to?(:label)
          association.label
        elsif association.respond_to?(:title)
          association.title
        elsif association.respond_to?(:name)
          association.name
        else
          warn "#{association.class} must respond to label, title, or name"
          nil
        end
      end

      def hidden_tag_value
        association.id if association
      end

      def sanitized_object_name
        @sanitized_object_name ||= object_name.to_s.gsub(/\]\[|[^-a-zA-Z0-9:.]/, '_').sub(/_$/, '')
      end

      def sanitized_method
        @sanitized_method ||= method.to_s.sub(/\?$/, '')
      end

      def association
        @association ||= begin
          association_name = method.to_s
          association_name.gsub!(/_id\z/, '')
          @builder.object.send(association_name.to_sym)
        end
      end
    end
  end
end
