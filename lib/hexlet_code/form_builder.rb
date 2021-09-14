# frozen_string_literal: true

module HexletCode
  autoload :Tag, 'hexlet_code/tags/tag'
  autoload :Tags, 'hexlet_code/tags/tags'

  class FormBuilder
    class << self
      def build(form)
        inputs = form.inputs
        form.options[:action] = form.options.delete :url
        options = { action: '#', method: 'post' }.merge(form.options)

        builded_tags = inputs.map do |input|
          type = input[:type]
          attributes = input[:attributes]
          tag = Tags.get_by_type(type)
          tag.build(**attributes)
        end

        form_body_str = "#{builded_tags.reduce('') { |acc, tag| "#{acc}\n  #{tag}" }}\n"
        Tags::Tag.build('form', **options) { form_body_str }
      end
    end
  end
end
