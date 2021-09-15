# frozen_string_literal: true

module HexletCode
  module Tags
    autoload :Tag, 'hexlet_code/tags/tag'
    autoload :Label, 'hexlet_code/tags/label'

    class Input
      def self.build(attributes)
        result = []
        result << Label.build(attributes)
        result << Tag.build('input', type: 'text', **attributes)
        result.join("\n  ")
      end
    end
  end
end
