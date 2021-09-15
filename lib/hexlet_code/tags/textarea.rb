# frozen_string_literal: true

module HexletCode
  module Tags
    autoload :Label, 'hexlet_code/tags/label'

    class Textarea
      DEFAULT_ATTRIBUTES = {
        cols: '20',
        rows: '40'
      }.freeze

      def self.build(value: '', **attributes)
        updated_attributes = DEFAULT_ATTRIBUTES.merge(attributes)
        result = []
        result << Label.build(attributes)
        result << Tag.build('textarea', updated_attributes) { value }
        result.join("\n  ")
      end
    end
  end
end
