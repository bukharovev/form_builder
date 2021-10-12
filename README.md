## Installation

Add this line to your application's Gemfile:

```ruby
gem 'form_builder'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install form_builder

## Usage

Example:
```ruby
User = Struct.new(:name, :second_name, :job, keyword_init: true)
user = User.new name: 'rob', job: 'google'

FormBuilder.form_for user, url: '/users' do |f|
  f.input :name, class: 'some-class'
  f.input :second_name
  f.input :job, as: :text, cols: 30, rows: 5
  f.submit 'Send'
end
```
Will return:
```html
<form action="/users" method="post">
  <label for="name">Name</label>
  <input type="text" name="name" value="rob" class="some-class">
  <label for="second_name">Second_name</label>
  <input type="text" name="second_name">
  <label for="job">Job</label>
  <textarea cols="30" rows="5" name="job" as="text">google</textarea>
  <input type="submit" value="Send" name="commit">
</form>
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
