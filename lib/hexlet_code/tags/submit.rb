# frozen_string_literal: true

module HexletCode
  module Tags
    class Submit
      DEFAULT_ATTRIBUTES = {
        type: 'submit',
        value: 'Save',
        name: 'commit'
      }.freeze

      def self.build(attributes)
        merged_attributes = DEFAULT_ATTRIBUTES.merge(attributes)
        Tag.build('input', merged_attributes)
      end
    end
  end
end
