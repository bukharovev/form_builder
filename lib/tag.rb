# frozen_string_literal: true

# tag module
module Tag
  class << self
    def build_attributes(attributes)
      attributes.reduce('') do |res, (key, value)|
        res = %(#{res} #{key}="#{value}") if value
        res
      end
    end

    def build(tag_name, attributes_raw = {}, &block)
      tag_body = yield if block

      result = if attributes_raw
                 attributes = build_attributes attributes_raw
                 %(<#{tag_name}#{attributes}>)
               else
                 %(<#{tag_name}>)
               end

      result = %(#{result}#{tag_body}</#{tag_name}>) if tag_body
      result
    end
  end
end
