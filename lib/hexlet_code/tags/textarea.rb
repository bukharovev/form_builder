# frozen_string_literal: true

module HexletCode
  module Tags
    class Textarea
      DEFAULT_ATTRIBUTES = {
        cols: '20',
        rows: '40'
      }.freeze

      def self.build(value: '', **attributes)
        result = []
        result << Label.build(attributes)
        result << Tag.build('textarea', attributes: DEFAULT_ATTRIBUTES.merge(attributes)) { value }
        result.join("\n  ")
      end
    end
  end
end
