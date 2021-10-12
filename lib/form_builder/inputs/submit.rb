# frozen_string_literal: true

module FormBuilder
  module Inputs
    class Submit
      DEFAULT_ATTRIBUTES = {
        type: 'submit',
        value: 'Save',
        name: 'commit'
      }.freeze

      def self.build(options: {}, **attributes)
        Tag.build('input', attributes: DEFAULT_ATTRIBUTES.merge(attributes), options: options)
      end
    end
  end
end
