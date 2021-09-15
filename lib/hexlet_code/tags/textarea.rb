# frozen_string_literal: true

module HexletCode
  module Tags
    autoload :Tag, 'hexlet_code/tags/tag'

    class Textarea
      DEFAULT_ATTRIBUTES = {
        cols: '20',
        rows: '40'
      }.freeze
      class << self
        def build(value: '', **options)
          updated_options = DEFAULT_ATTRIBUTES.merge(options)
          result = []
          result << Tag.build('label', for: options[:name]) { options[:name].capitalize }
          result << Tag.build('textarea', **updated_options) { value }
          result.join("\n  ")
        end
      end
    end
  end
end
