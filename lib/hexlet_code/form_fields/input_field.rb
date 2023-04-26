# frozen_string_literal: true

module HexletCode
  class InputField < Tag
    TYPE = :text

    attr_reader :value, :name

    def initialize(name:, object:, **attributes)
      super
      @attributes = attributes
      @value = object.public_send(name)
      @name = name
      @tag_name = :input
    end

    def tag_attributes
      @tag_attributes ||= {
        name:,
        type: TYPE,
        value:,
        **attributes
      }
    end
  end
end
