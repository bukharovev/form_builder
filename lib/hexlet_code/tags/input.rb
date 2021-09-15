# frozen_string_literal: true

module HexletCode
  module Tags
    class Input
      DEFAULT_ATTRIBUTES = {
        type: 'text'
      }.freeze

      def self.build(options: {}, **attributes)
        result = []
        result << Label.build(options: options, **attributes)
        result << Tag.build('input', attributes: DEFAULT_ATTRIBUTES.merge(attributes), options: options)
        result.join("\n")
      end
    end
  end
end
