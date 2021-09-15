# frozen_string_literal: true

module HexletCode
  module Tags
    class Input
      def self.build(attributes)
        result = []
        result << Label.build(attributes)
        result << Tag.build('input', type: 'text', **attributes)
        result.join("\n  ")
      end
    end
  end
end
