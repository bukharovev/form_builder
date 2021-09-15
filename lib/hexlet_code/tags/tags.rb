# frozen_string_literal: true

module HexletCode
  module Tags
    autoload :Input, 'hexlet_code/tags/input'
    autoload :Submit, 'hexlet_code/tags/submit'
    autoload :Textarea, 'hexlet_code/tags/textarea'
    autoload :Select, 'hexlet_code/tags/select'

    class << self
      TAG_TYPES = {
        input: Input,
        submit: Submit,
        text: Textarea,
        select: Select
      }.freeze

      def get_by_type(type)
        TAG_TYPES[type]
      end
    end
  end
end
