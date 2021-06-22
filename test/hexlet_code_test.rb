# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/hexlet_code'

class HexletCodeTest < Minitest::Test
  include Rails::Dom::Testing::Assertions

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  User = Struct.new(:name, :second_name, :job, keyword_init: true)
  EXPECTED_FORM = %(<form action="/users" method="post">
  <label for="name">Name</label>
  <input type="text" name="name" value="rob" class="some-class">
  <label for="second_name">Second_name</label>
  <input type="text" name="second_name">
  <label for="job">Job</label>
  <textarea cols="30" rows="5" name="job" as="text">google</textarea>
  <input type="submit" value="Send" name="commit">
</form>)

  def test_form_for
    user = User.new name: 'rob', job: 'google'
    form = HexletCode.form_for user, url: '/users' do |f|
      f.input :name, class: 'some-class'
      f.input :second_name
      f.input :job, as: :text, cols: 30, rows: 5
      f.submit 'Send'
    end

    assert_dom_equal EXPECTED_FORM, form
  end
end
