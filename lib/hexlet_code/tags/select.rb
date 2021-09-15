# frozen_string_literal: true

module HexletCode
  module Tags
    class Select
      class << self
        def build(attributes)
          space = ' '
          select_body = build_select_options(attributes[:collection])
          select_body_str = "#{select_body.reduce('') { |acc, tag| "#{acc}\n#{space * 4}#{tag}" }}\n#{space * 2}"
          result = []
          result << Tag.build('select', attributes.except(:collection)) { select_body_str }
          result.join("\n#{space * 2}")
        end

        private

        def build_select_options(collection)
          collection.each_with_index.map do |value, index|
            if index.zero?
              Tag.build('option', value: value, selected: nil) { value }
            else
              Tag.build('option', value: value) { value }
            end
          end
        end
      end
    end
  end
end
