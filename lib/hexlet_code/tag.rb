# frozen_string_literal: true

module HexletCode
  class Tag
    class << self
      def build(tag_name, raw_attributes = {})
        tag_body = yield if block_given?
        attributes = build_attributes(raw_attributes)

        if tag_body.nil?
          %(<#{tag_name}#{attributes}>)
        else
          %(<#{tag_name}#{attributes}>#{tag_body}</#{tag_name}>)
        end
      end

      private

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
    end
  end
end
