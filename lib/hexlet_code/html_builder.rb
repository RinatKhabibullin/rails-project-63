# frozen_string_literal: true

module HexletCode
  class HtmlBuilder
    VOID_ELEMENTS_NAMES = %i[area base br col embed hr img input link meta param
                             source track wbr>].freeze

    attr_reader :tag, :deep, :tag_name

    class << self
      def build(tag, deep = 0)
        new(tag, deep).build
      end
    end

    def initialize(tag, deep)
      @tag = tag
      @deep = deep
      @tag_name = tag.tag_name
    end

    def build
      VOID_ELEMENTS_NAMES.include?(tag_name) ? void_element : paired_element
    end

    private

    def void_element
      @void_element ||= %(<#{tag_name}#{stringify_attributes}>)
    end

    def paired_element
      @paired_element ||= nested_tags? ? multiple_rows_paired_element : single_row_paired_element
    end

    def single_row_paired_element
      %(<#{tag_name}#{stringify_attributes}>#{body}</#{tag_name}>)
    end

    def multiple_rows_paired_element
      %(<#{tag_name}#{stringify_attributes}>\n#{'  ' * (deep + 1)}#{body}\n#{'  ' * deep}</#{tag_name}>)
    end

    def stringify_attributes
      @stringify_attributes ||= tag.field_attributes.to_a.map { |tag_name, value| %( #{tag_name}="#{value}") }.join
    end

    def body
      nested_tags? ? build_nested_elements : tag.body.first.to_s
    end

    def build_nested_elements
      tag.body
         .map { |body_element| body_element.is_a?(Tag) ? HtmlBuilder.build(body_element, deep + 1) : body_element.to_s }
         .join("\n#{'  ' * (deep + 1)}")
    end

    def nested_tags?
      @nested_tags ||= tag.body.any? { |body_element| body_element.is_a?(Tag) }
    end
  end
end
