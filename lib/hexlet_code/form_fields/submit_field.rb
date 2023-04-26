# frozen_string_literal: true

module HexletCode
  class SubmitField < Tag
    TYPE = :submit
    DEFAULT_VALUE = 'Save'

    attr_reader :value

    def initialize(value: nil)
      super
      @value = value
    end

    def field_attributes
      @field_attributes ||= {
        type: TYPE,
        value: value || DEFAULT_VALUE
      }
    end

    def tag_name
      :input
    end
  end
end
