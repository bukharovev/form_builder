# frozen_string_literal: true

module HexletCode
  module Tags
    autoload :Tag, 'hexlet_code/tags/tag'

    class Submit
      DEFAULT_ATTRIBUTES = {
        type: 'submit',
        value: 'Save',
        name: 'commit'
      }.freeze

      def self.build(options)
        merged_options = DEFAULT_ATTRIBUTES.merge(options)
        Tag.build('input', merged_options)
      end
    end
  end
end
