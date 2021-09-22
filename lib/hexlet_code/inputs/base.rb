# frozen_string_literal: true

module HexletCode
  module Inputs
    class Base
      def self.input(tag_name, options: {}, attributes: {})
        tag_body = yield if block_given?
        label = Tag.build('label', attributes: { for: attributes[:name] },
                                   options: options.except(:with_nested_body)) do
          attributes[:name].capitalize
        end
        tag = Tag.build(tag_name, attributes: attributes, options: options) { tag_body }
        [label, tag].join("\n")
      end
    end
  end
end
