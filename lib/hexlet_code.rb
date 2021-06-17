# frozen_string_literal: true

require_relative 'hexlet_code/version'

# module
module HexletCode
  class Error < StandardError; end

  def self.form_for(entity, &block)
    @entity = entity.to_h
    @form = '<form action="#" method="post">'
    yield self if block
    %(#{@form}\n</form>)
  end

  # rubocop:disable Naming/MethodParameterName
  def self.input(field, as: nil)
    return unless @entity.key? field

    value = @entity[field]
    tag = if as == :text
            Tag.build('textarea', cols: '20', rows: '40', name: field) { value }
          else
            Tag.build('input', type: 'text', value: value, name: field)
          end

    @form = %(#{@form}\n\t#{tag})
  end
  # rubocop:enable Naming/MethodParameterName

  # tag module
  module Tag
    def self.build_attributes(attributes)
      attributes.reduce('') do |res, (key, value)|
        %(#{res} #{key}="#{value}")
      end
    end

    def self.build(tag_name, *attributes_row, &block)
      tag_body = yield if block
      attributes_hash = attributes_row.first

      result = if attributes_hash
                 attributes = build_attributes attributes_hash
                 %(<#{tag_name}#{attributes}>)
               else
                 "<#{tag_name}>"
               end

      result = %(#{result}#{tag_body}</#{tag_name}>) if tag_body
      result
    end
  end
end
