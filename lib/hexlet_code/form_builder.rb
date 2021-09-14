# frozen_string_literal: true

module HexletCode
  autoload :Tag, 'hexlet_code/tags/tag'
  autoload :Tags, 'hexlet_code/tags/tags'

  class FormBuilder
    class << self
      DEFAULT_FORM_ATTRIBUTES = {
        action: '#',
        method: 'post'
      }.freeze

      def build(form)
        inputs, form_attributes = *form
        form.options[:action] = form.options.delete :url
        updated_form_attributes = DEFAULT_FORM_ATTRIBUTES.merge(form_attributes)

        builded_tags = inputs.map do |input|
          type, attributes = input.values_at(:type, :attributes)
          tag = Tags.get_by_type(type)
          tag.build(**attributes)
        end

        form_body_str = "#{builded_tags.reduce('') { |acc, tag| "#{acc}\n  #{tag}" }}\n"
        Tags::Tag.build('form', **updated_form_attributes) { form_body_str }
      end
    end
  end
end
