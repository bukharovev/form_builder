# frozen_string_literal: true

module HexletCode
  class Form
    attr_reader :inputs, :attributes

    def initialize(entity, attributes)
      @entity = entity
      @attributes = attributes
      @inputs = []
    end

    def input(name, **options)
      value = @entity[name]
      @inputs << {
        type: options[:as] || :input,
        attributes: { name: name, value: value, **options }
      }
    end

    def submit(button_name = 'Save', **options)
      @inputs << {
        type: :submit,
        attributes: { value: button_name, **options }
      }
    end
  end
end
