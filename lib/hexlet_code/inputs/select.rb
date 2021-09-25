# frozen_string_literal: true

module HexletCode
  module Inputs
    class Select < Base
      class << self
        def build(options: {}, **attributes)
          depth = options.fetch(:depth, 0)
          updated_options = options.merge({ depth: depth + 1 })
          selected_value = attributes[:value]
          select_body = build_select_body(attributes[:collection], options: updated_options,
                                                                   selected_value: selected_value)

          select_body_str = select_body.join("\n")
          input('select', attributes: attributes.except(:collection, :value),
                          options: options.merge({ with_nested_body: true })) do
            select_body_str
          end
        end

        private

        def build_select_body(collection, options: {}, selected_value: nil)
          collection.each_with_index.map do |value, _index|
            attrs = { value: value }
            attrs.merge!(selected: nil) if selected_value == value
            Tag.build('option', attributes: attrs, options: options) { value }
          end
        end
      end
    end
  end
end
