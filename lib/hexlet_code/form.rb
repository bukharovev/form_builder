# frozen_string_literal: true

module HexletCode
  class Form
    attr_reader :inputs, :options

    def initialize(entity, options)
      @entity = entity
      @options = options
      @inputs = []
    end

    def input(name, as: :input, **options)
      value = @entity[name]
      @inputs << {
        type: as,
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
