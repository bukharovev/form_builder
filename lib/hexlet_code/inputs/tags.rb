# frozen_string_literal: true

module HexletCode
  module Inputs
    autoload :Input, 'hexlet_code/inputs/input'
    autoload :Submit, 'hexlet_code/inputs/submit'
    autoload :Textarea, 'hexlet_code/inputs/textarea'
    autoload :Select, 'hexlet_code/inputs/select'
    autoload :Label, 'hexlet_code/inputs/label'

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
