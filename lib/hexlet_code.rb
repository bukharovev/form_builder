# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end

  module Tag
    def self.build(tag_name, *attributes_row, &block)
      tag_body = yield if block
      attributes_hash = attributes_row.first

      result = ''
      if attributes_hash
        attributes = attributes_hash.reduce('') do |res, (key, value)|
          %Q[#{res} #{key}="#{value}"]
        end

        result = "<#{tag_name}#{attributes}>"
      else
        result = "<#{tag_name}>"
      end

      result = "#{result}#{tag_body}</#{tag_name}>" if tag_body

      result
    end
  end
end
