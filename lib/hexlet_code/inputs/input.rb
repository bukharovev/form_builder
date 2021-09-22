# frozen_string_literal: true

module HexletCode
  module Inputs
    class Input < Base
      DEFAULT_ATTRIBUTES = {
        type: 'text'
      }.freeze

      def self.build(options: {}, **attributes)
        input('input', attributes: DEFAULT_ATTRIBUTES.merge(attributes), options: options)
      end
    end
  end
end
