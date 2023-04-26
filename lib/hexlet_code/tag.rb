# frozen_string_literal: true

module HexletCode
  class Tag
    attr_reader :body, :attributes
    attr_accessor :tag_name

    class << self
      def build(name, **attributes, &)
        tag = new(**attributes, &)
        tag.tag_name = name.to_sym
        HtmlBuilder.build(tag)
      end
    end

    def initialize(**attributes)
      @body = []
      @attributes = attributes
      @body = [*body, yield].flatten if block_given?
    end

    def tag_attributes
      attributes
    end
  end
end
