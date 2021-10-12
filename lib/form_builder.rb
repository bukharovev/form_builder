# frozen_string_literal: true

module FormBuilder
  autoload :VERSION, 'form_builder/version'
  autoload :Form, 'form_builder/form'
  autoload :Renderer, 'form_builder/renderer'

  def self.form_for(model, form_attributes, &block)
    return unless block

    form = Form.new(model, form_attributes)
    yield form

    Renderer.render form
  end
end
