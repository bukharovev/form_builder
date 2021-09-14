# frozen_string_literal: true

module HexletCode
  module Tags
    class Tag
      class << self
        def build(tag_name, raw_options = {})
          tag_body = yield if block_given?
          options = build_options(raw_options)

          if tag_body.nil?
            %(<#{tag_name}#{options}>)
          else
            %(<#{tag_name}#{options}>#{tag_body}</#{tag_name}>)
          end
        end

        private

        def build_options(options)
          options.reduce('') do |res, (key, value)|
            res = %(#{res} #{key}="#{value}") if value
            res
          end
        end
      end
    end
  end
end
