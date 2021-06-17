## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hexlet_code

## Usage

```ruby
User = Struct.new(:name, :job, keyword_init: true)
user = User.new job: 'hexlet'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job
  f.submit
end

# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input type="text" name="name">
#   <label for="job">Job</label>
#   <input type="text" name="job" value="hexlet">
#   <input type="submit" value="Save" name="commit">
# </form>
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
