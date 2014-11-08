require 'spec_helper'

describe Formtastic::Inputs::AutocompleteInput do
  let(:controller) { MockController.new }

  describe '#input' do
    subject { Nokogiri::HTML(form) }

    let(:record) { Ingredient.new }
    let(:collection) { %w[cup teaspoon tablespoon] }
    let(:options) { {} }
    let(:form) do
      concat(semantic_form_for(record) { |f|
        concat(f.input :name, { as: :autocomplete, source: ingredients_autocomplete_path }.merge(options))
        concat(f.input :unit, { as: :autocomplete, source: collection }.merge(options))
      })
    end

    describe 'with default options' do
      it 'should set the default input class' do
        input = subject.xpath('//input[@id="ingredient_name_autocomplete"]')
        expect(input.attribute('class').value).to match /\bautocomplete\b/
      end

      it 'should set the source url' do
        input = subject.xpath('//input[@id="ingredient_name_autocomplete"]')
        expect(input.attribute('data-source').value).to eq ingredients_autocomplete_path
      end

      it 'should set the source json' do
        input = subject.xpath('//input[@id="ingredient_unit_autocomplete"]')
        expect(input.attribute('data-source').value).to eq CGI.escape_element(collection.to_json)
      end

      it 'should render a hidden input' do
        input = subject.xpath('//input[@id="ingredient_name"]')
        expect(input.attribute('type').value).to eq 'hidden'
      end
    end

    describe 'with custom options' do
      let(:options) { { input_html: { id: 'baz', class: 'completer', data: { foo: 'bar' } } } }

      it 'should set the custom input class' do
        input = subject.xpath('//input[@id="baz"]')
        expect(input.attribute('class').value).to match /\bcompleter\b/
      end

      it 'should set the custom input id' do
        input = subject.xpath('//input[@id="baz"]')
        expect(input.attribute('id').value).to eq 'baz'
      end

      it 'should set the custom input data attribute' do
        input = subject.xpath('//input[@id="baz"]')
        expect(input.attribute('data-foo').value).to eq 'bar'
      end

      it 'should set the custom input data attribute' do
        input = subject.xpath('//input[@id="baz"]')
        expect(input.attribute('data-foo').value).to eq 'bar'
      end

      it 'should maintain the input source data attribute' do
        input = subject.xpath('//input[@id="baz"]')
        expect(input.attribute('data-source').value).to eq ingredients_autocomplete_path
      end
    end
  end
end
