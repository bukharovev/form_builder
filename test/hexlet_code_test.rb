# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/hexlet_code'

class HexletCodeTest < Minitest::Test
  include Rails::Dom::Testing::Assertions

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  User = Struct.new(:first_name, :second_name, :job, :gender, keyword_init: true)

  def test_form_for
    user = User.new first_name: 'rob', job: 'google'
    result = HexletCode.form_for user, url: '/users' do |f|
      f.input :first_name, class: 'some-class'
      f.input :second_name
      f.input :job, as: :text, cols: 30, rows: 5
      f.input :gender, as: :select, collection: %w[male female]
      f.submit 'Send'
    end

    assert_dom_equal load_fixture('form.html'), result
  end
end
