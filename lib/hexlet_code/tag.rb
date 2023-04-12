# frozen_string_literal: true

module HexletCode
  class Tag
    VOID_ELEMENTS_NAMES = [:area, :base, :br, :col, :embed, :hr, :img, :input, :link, :meta, :param,
                           :source, :track, "wbr>".to_sym].freeze

    attr_reader :name, :attributes, :body

    class << self
      def build(name, attributes = {}, &block)
        new(name, attributes, &block).build
      end
    end

    def initialize(name, attributes, &block)
      @name = name.to_sym
      @attributes = attributes
      @body = block.nil? ? "" : block.call
    end

    def build
      VOID_ELEMENTS_NAMES.include?(name) ? void_element : paired_element
    end

    private

    def void_element
      @void_element ||= %(<#{name}#{stringify_attributes}>)
    end

    def paired_element
      @paired_element ||= %(<#{name}#{stringify_attributes}>#{body}</#{name}>)
    end

    def stringify_attributes
      @stringify_attributes ||= attributes.to_a.map { |name, value| %( #{name}="#{value}") }.join
    end
  end
end
