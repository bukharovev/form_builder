# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'tag'

# module
module HexletCode
  class Error < StandardError; end

  class << self
    def form_for(entity, url: '#', &block)
      return unless block

      @entity = entity
      @form = %(<form action="#{url}" method="post">)
      yield self if block
      %(#{@form}\n</form>)
    end

    def add_label(value)
      label = Tag.build('label', for: value) { value.capitalize }
      @form = %(#{@form}\n  #{label})
    end

    def input(field, attributes = {})
      # return if @entity[field].nil?

      add_label field
      value = @entity[field]
      tag = if attributes.fetch(:as, nil)
              Tag.build('textarea', cols: '20', rows: '40', name: field, **attributes) { value }
            else
              Tag.build('input', type: 'text', name: field, value: value, **attributes)
            end

      @form = %(#{@form}\n  #{tag})
    end

    def submit(button_name = 'Save')
      tag = Tag.build('input', type: 'submit', value: button_name, name: 'commit')
      @form = %(#{@form}\n  #{tag})
    end
  end
end
