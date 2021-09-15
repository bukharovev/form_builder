# frozen_string_literal: true

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :Tags, 'hexlet_code/tags/tags'

  class FormBuilder
    class << self
      DEFAULT_FORM_ATTRIBUTES = {
        action: '#',
        method: 'post'
      }.freeze

      def build(form)
        form.attributes[:action] = form.attributes.delete :url
        updated_form_attributes = DEFAULT_FORM_ATTRIBUTES.merge(form.attributes)

        builded_tags = form.inputs.map do |input|
          type, attributes = input.values_at(:type, :attributes)
          Tags.get_by_type(type).build(**attributes.except(:as))
        end

        form_body_str = "#{builded_tags.reduce('') { |acc, tag| "#{acc}\n  #{tag}" }}\n"
        Tag.build('form', updated_form_attributes) { form_body_str }
      end
    end
  end
end
