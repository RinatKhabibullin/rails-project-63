# frozen_string_literal: true

module HexletCode
  class SubmitField < Tag
    TYPE = :submit
    DEFAULT_VALUE = 'Save'

    attr_reader :value

    def initialize(value: nil)
      super
      @tag_name = :input
      @value = value
    end

    def tag_attributes
      @tag_attributes ||= {
        type: TYPE,
        value: value || DEFAULT_VALUE
      }
    end
  end
end
