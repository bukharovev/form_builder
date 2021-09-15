# frozen_string_literal: true

module HexletCode
  class Tag
    class << self
      def build(name, attributes: {}, options: {})
        body = yield if block_given?
        builded_attributes = build_attributes(attributes)
        indent = indent(options.fetch(:depth, 0))

        if options.fetch(:with_nested_body, false)
          build_nested_tag(indent, name, builded_attributes, body)
        elsif body.nil?
          build_single_tag(indent, name, builded_attributes)
        else
          build_paired_tag(indent, name, builded_attributes, body)
        end
      end

      private

      def indent(depth)
        space = ' '
        indentation_size = 2
        space * indentation_size * depth
      end

      def build_attributes(attributes)
        attributes.reduce('') do |res, (key, value)|
          if value
            %(#{res} #{key}="#{value}")
          elsif key != :value
            %(#{res} #{key})
          else
            res
          end
        end
      end

      def build_nested_tag(indent, name, attributes, body)
        open_tag = "#{indent}<#{name}#{attributes}>"
        closed_tag = "#{indent}</#{name}>"
        "#{open_tag}\n#{body}\n#{closed_tag}"
      end

      def build_single_tag(indent, name, attributes)
        "#{indent}<#{name}#{attributes}>"
      end

      def build_paired_tag(indent, name, attributes, body)
        open_tag = "#{indent}<#{name}#{attributes}>"
        closed_tag = "</#{name}>"
        "#{open_tag}#{body}#{closed_tag}"
      end
    end
  end
end
