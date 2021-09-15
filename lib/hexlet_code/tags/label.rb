# frozen_string_literal: true

module HexletCode
  module Tags
    autoload :Tag, 'hexlet_code/tags/tag'

    class Label
      def self.build(attributes)
        Tag.build('label', for: attributes[:name]) { attributes[:name].capitalize }
      end
    end
  end
end
