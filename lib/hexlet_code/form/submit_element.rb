# frozen_string_literal: true

class SubmitElement
  TAG_NAME = :input
  TYPE = :submit
  DEFAULT_VALUE = 'Save'

  attr_reader :value

  def self.build(**attributes)
    new(**attributes).build
  end

  def initialize(**attributes)
    @value = attributes[:value]
  end

  def build
    HexletCode::Tag.build(tag_name, element_attributes)
  end

  private

  def element_attributes
    @element_attributes ||= {
      type: TYPE,
      value: value || DEFAULT_VALUE
    }
  end

  def tag_name
    TAG_NAME
  end
end
