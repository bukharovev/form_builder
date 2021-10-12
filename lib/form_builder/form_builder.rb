# frozen_string_literal: true

module FormBuilder
  autoload :Tag, 'form_builder/tag'
  autoload :Inputs, 'form_builder/inputs/inputs'

  class FormBuilder
    class << self
      DEFAULT_FORM_ATTRIBUTES = {
        action: '#',
        method: 'post'
      }.freeze

      def build(form)
        form.attributes[:action] = form.attributes.delete :url # replace :url key to :action

        builded_tags = form.inputs.map do |input|
          type, attributes = input.values_at(:type, :attributes)
          tag = Object.const_get "FormBuilder::Inputs::#{type.capitalize}"
          tag.build(**attributes.except(:as), options: { depth: 1 })
        end

        options = { depth: 0, with_nested_body: true }
        Tag.build('form', attributes: DEFAULT_FORM_ATTRIBUTES.merge(form.attributes), options: options) do
          builded_tags.join("\n")
        end
      end
    end
  end
end
