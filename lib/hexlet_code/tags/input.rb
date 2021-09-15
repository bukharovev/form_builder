# frozen_string_literal: true

module HexletCode
  module Tags
    autoload :Tag, 'hexlet_code/tags/tag'

    class Input
      def self.build(attributes)
        result = []
        result << Tag.build('label', for: attributes[:name]) { attributes[:name].capitalize }
        result << Tag.build('input', type: 'text', **attributes)
        result.join("\n  ")
      end
    end
  end
end
