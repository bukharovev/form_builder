# frozen_string_literal: true

module HexletCode
  class Tag
    class << self
      SINGLE_TAGS = %i[area br img input link].freeze

      def build(name, attributes: {}, options: {})
        body = yield if block_given?
        builded_attributes = build_attributes(attributes)
        indent = indent(options.fetch(:depth, 0))

        open_tag = "<#{name} #{builded_attributes}>"
        closed_tag = "</#{name}>"

        if SINGLE_TAGS.include?(name)
          "#{indent}#{open_tag}"
        elsif options.fetch(:with_nested_body, false)
          "#{indent}#{open_tag}\n#{body}\n#{indent}#{closed_tag}"
        else
          "#{indent}#{open_tag}#{body}#{closed_tag}"
        end
      end

      private

      def indent(depth)
        space = ' '
        indentation_size = 2
        space * indentation_size * depth
      end

      def build_attributes(attributes)
        attributes
          .map { |(key, value)| value.nil? ? key.to_s : %(#{key}="#{value}") }
          .join(' ')
      end
    end
  end
end
