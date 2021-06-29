# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'tag'

# module
module HexletCode
  class << self
    def form_for(entity, url: '#', &block)
      return unless block

      @tags = []
      @entity = entity

      yield self if block

      build_form(@tags, url)
    end

    def input(field, attributes = {})
      # return if @entity[field].nil?

      value = @entity[field]
      as = attributes.fetch(:as, nil)
      tag = case as
            when :text
              build_textarea(field, attributes, value)
            else
              build_input(field, attributes, value)
            end

      @tags << tag
    end

    def submit(button_name = 'Save')
      tag = Tag.build('input', type: 'submit', value: button_name, name: 'commit')
      @tags << tag
    end

    private

    def add_label(value)
      label = Tag.build('label', for: value) { value.capitalize }
      @tags << label
    end

    def build_form(tags, form_url)
      form_open_tag = %(<form action="#{form_url}" method="post">)
      form_closed_tag = '</form>'
      form_body = tags.reduce('') { |acc, tag| %(#{acc}\n  #{tag}) }

      %(#{form_open_tag}#{form_body}\n#{form_closed_tag})
    end

    def build_textarea(field, attributes, value)
      add_label field
      Tag.build('textarea', cols: '20', rows: '40', name: field, **attributes) { value }
    end

    def build_input(field, attributes, value)
      add_label field
      Tag.build('input', type: 'text', name: field, value: value, **attributes)
    end
  end
end
