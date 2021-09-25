# frozen_string_literal: true

module HexletCode
  class Tag
    class << self
      SINGLE_TAGS = %i[area br img input link].freeze

      def build(tag_name, attributes: {}, options: {})
        body = yield if block_given?
        builded_attributes = build_attributes(attributes)
        indent = indent(options.fetch(:depth, 0))

        open_tag = "<#{tag_name} #{builded_attributes}>"
        closed_tag = "</#{tag_name}>"

        return "#{indent}#{open_tag}" if SINGLE_TAGS.include?(tag_name.to_sym)
        return "#{indent}#{open_tag}\n#{body}\n#{indent}#{closed_tag}" if options.fetch(:with_nested_body, false)

        "#{indent}#{open_tag}#{body}#{closed_tag}"
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
