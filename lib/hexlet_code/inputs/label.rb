# frozen_string_literal: true

module HexletCode
  module Inputs
    class Label
      def self.build(options: {}, **attributes)
        Tag.build('label', attributes: { for: attributes[:name] }, options: options) { attributes[:name].capitalize }
      end
    end
  end
end
