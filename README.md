# FormtasticAutocomplete

`formtastic_autocomplete` is a gem that enables use of jQuery autocomplete inputs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'formtastic_autocomplete'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install formtastic_autocomplete

## Usage

Require the Javascript in your `application.js` (or other preferred) file via sprockets:

```javascript
//= require formtastic_autocomplete
```

Optionally import the CSS in your `application.css.scss` (or other preferred) file.  For
sprockets-based apps:

```javascript
//= require formtastic_autocomplete
```

For SCSS imports:

```javascript
@import 'formtastic_autocomplete';
```

When rendering form via Formtastic's `semantic_form_for` method, supply the new input via the `:as`
option along with a `:source` option to specify the data source URL or array of objects:

```ruby
semantic_form_for @ingredient do |f|
  f.input :name, as: :autocomplete, source: autocomplete_ingredients_path
  f.input :unit, as: :autocomplete, source: ['cup', 'tablespoon', 'teaspoon']
  f.input :quantity
end
```

The value supplied for the `:source` option should match the format expected per the [jQuery
autocomplete documentation](http://api.jqueryui.com/autocomplete/#option-source).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
