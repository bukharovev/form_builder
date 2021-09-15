# frozen_string_literal: true

module HexletCode
  module Tags
    class Select
      class << self
        def build(options: {}, **attributes)
          depth = options.fetch(:depth, 0)
          updated_options = options.merge({ depth: depth + 1 })
          select_body = build_select_options(attributes[:collection], options: updated_options)

          select_body_str = select_body.join("\n")
          Tag.build('select', attributes: attributes.except(:collection),
                              options: options.merge({ with_nested_body: true })) do
            select_body_str
          end
        end

        private

        def build_select_options(collection, options: {})
          collection.each_with_index.map do |value, index|
            if index.zero?
              Tag.build('option', attributes: { value: value, selected: nil }, options: options) { value }
            else
              Tag.build('option', attributes: { value: value }, options: options) { value }
            end
          end
        end
      end
    end
  end
end
