# frozen_string_literal: true

module HexletCode
  module Inputs
    class Text < Base
      DEFAULT_ATTRIBUTES = {
        cols: '20',
        rows: '40'
      }.freeze

      def self.build(value: '', options: {}, **attributes)
        input('textarea', attributes: DEFAULT_ATTRIBUTES.merge(attributes), options: options) { value }
      end
    end
  end
end
