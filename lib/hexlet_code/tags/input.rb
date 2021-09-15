# frozen_string_literal: true

module HexletCode
  module Tags
    class Input
      DEFAULT_ATTRIBUTES = {
        type: 'text'
      }.freeze

      def self.build(attributes)
        updated_attributes = DEFAULT_ATTRIBUTES.merge(attributes)
        result = []
        result << Label.build(attributes)
        result << Tag.build('input', **updated_attributes)
        result.join("\n  ")
      end
    end
  end
end
