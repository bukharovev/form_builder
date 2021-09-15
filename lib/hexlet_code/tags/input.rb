# frozen_string_literal: true

module HexletCode
  module Tags
    autoload :Tag, 'hexlet_code/tags/tag'

    class Input
      def self.build(options)
        result = []
        result << Tag.build('label', for: options[:name]) { options[:name].capitalize }
        result << Tag.build('input', type: 'text', **options)
        result.join("\n  ")
      end
    end
  end
end
