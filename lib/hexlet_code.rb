# frozen_string_literal: true

module HexletCode
  autoload :VERSION, 'hexlet_code/version'
  autoload :Form, 'hexlet_code/form'
  autoload :FormBuilder, 'hexlet_code/form_builder'

  def self.form_for(model, form_attributes, &block)
    return unless block

    form = Form.new(model, form_attributes)
    yield form

    FormBuilder.build form
  end
end
