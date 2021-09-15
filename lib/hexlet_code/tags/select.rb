# frozen_string_literal: true

module HexletCode
  module Tags
    autoload :Tag, 'hexlet_code/tags/tag'

    class Select
      class << self
        def build_select_options(collection)
          collection.each_with_index.reduce([]) do |acc, (value, index)|
            acc << if index.zero?
                     Tag.build('option', value: value, selected: nil) { value }
                   else
                     Tag.build('option', value: value) { value }
                   end
          end
        end

        def build(attributes)
          select_body = build_select_options(attributes[:collection])
          space = ' '
          select_body_str = "#{select_body.reduce('') { |acc, tag| "#{acc}\n#{space * 4}#{tag}" }}\n#{space * 2}"
          result = []
          result << Tag.build('select', attributes.except(:collection)) { select_body_str }
          result.join("\n#{space * 2}")
        end
      end
    end
  end
end
