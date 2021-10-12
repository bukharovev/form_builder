# frozen_string_literal: true

module FormBuilder
  class Form
    attr_reader :inputs, :attributes

    def initialize(entity, attributes)
      @entity = entity
      @attributes = attributes
      @inputs = []
    end

    def input(name, **options)
      value = @entity[name]
      options = options.merge({ value: value }) unless value.nil?
      @inputs << {
        type: options[:as] || :input,
        attributes: { name: name, **options }
      }
    end

    def submit(button_name = 'Save', **attributes)
      @inputs << {
        type: :submit,
        attributes: { value: button_name, **attributes }
      }
    end
  end
end
