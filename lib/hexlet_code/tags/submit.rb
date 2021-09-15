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
        Tag.build('input', attributes: DEFAULT_ATTRIBUTES.merge(attributes))
      end
    end
  end
end
