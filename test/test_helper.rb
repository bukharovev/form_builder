# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'form_builder'

require 'minitest/autorun'
require 'rails-dom-testing'

def load_fixture(file_name)
  path_to_fixture = File.join(File.dirname(__FILE__), 'fixtures', file_name)
  File.read(path_to_fixture)
end
