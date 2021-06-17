# frozen_string_literal: true

require_relative 'hexlet_code/version'

# module
module HexletCode
  class Error < StandardError; end

  def self.form_for(entity, url: '#', &block)
    return unless block

    @entity = entity.to_h
    @form = %(<form action="#{url}" method="post">)
    yield self if block
    %(#{@form}\n</form>)
  end

  def self.add_label(value)
    label = Tag.build('label', for: value) { value.capitalize }
    @form = %(#{@form}\n  #{label})
  end

  def self.input(field, *attributes)
    return unless @entity.key? field

    attributes_hash = attributes.first || {}
    add_label field
    value = @entity[field]
    tag = if attributes_hash.fetch(:as, nil)
            Tag.build('textarea', cols: '20', rows: '40', name: field, **attributes_hash) { value }
          else
            Tag.build('input', type: 'text', name: field, value: value, **attributes_hash)
          end

    @form = %(#{@form}\n  #{tag})
  end

  def self.submit(button_name = 'Save')
    tag = Tag.build('input', type: 'submit', value: button_name, name: 'commit')
    @form = %(#{@form}\n  #{tag})
  end

  # tag module
  module Tag
    def self.build_attributes(attributes)
      attributes.reduce('') do |res, (key, value)|
        res = %(#{res} #{key}="#{value}") if value
        res
      end
    end

    def self.build(tag_name, *attributes_row, &block)
      tag_body = yield if block
      attributes_hash = attributes_row.first

      result = if attributes_hash
                 attributes = build_attributes attributes_hash
                 %(<#{tag_name}#{attributes}>)
               else
                 %(<#{tag_name}>)
               end

      result = %(#{result}#{tag_body}</#{tag_name}>) if tag_body
      result
    end
  end
end
