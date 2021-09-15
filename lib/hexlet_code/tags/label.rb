# frozen_string_literal: true

module HexletCode
  module Tags
    class Label
      def self.build(attributes)
        Tag.build('label', for: attributes[:name]) { attributes[:name].capitalize }
      end
    end
  end
end
