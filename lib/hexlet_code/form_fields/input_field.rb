# frozen_string_literal: true

module HexletCode
  class InputField < Tag
    TYPE = :text

    attr_reader :value, :name, :attributes

    def initialize(name:, object:, **attributes)
      super
      @attributes = attributes
      @value = object.public_send(name)
      @name = name
    end

    def field_attributes
      @field_attributes ||= {
        name:,
        type: TYPE,
        value:,
        **attributes
      }
    end

    def tag_name
      :input
    end
  end
end
