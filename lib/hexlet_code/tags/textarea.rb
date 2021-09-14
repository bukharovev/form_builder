# frozen_string_literal: true

module HexletCode
  module Tags
    autoload :Tag, 'hexlet_code/tags/tag'

    class Textarea
      class << self
        def build(value: '', **options)
          updated_options = { as: 'text' }.merge(options)
          result = []
          result << Tag.build('label', for: options[:name]) { options[:name].capitalize }
          result << Tag.build('textarea', cols: '20', rows: '40', **updated_options) { value }
          result.join("\n  ")
        end
      end
    end
  end
end
