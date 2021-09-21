# frozen_string_literal: true

module HexletCode
  module Inputs
    class Textarea
      DEFAULT_ATTRIBUTES = {
        cols: '20',
        rows: '40'
      }.freeze

      def self.build(value: '', options: {}, **attributes)
        result = []
        result << Label.build(options: options, **attributes)
        result << Tag.build('textarea', attributes: DEFAULT_ATTRIBUTES.merge(attributes), options: options) { value }
        result.join("\n")
      end
    end
  end
end
