# frozen_string_literal: true

class SubmitField
  TAG_NAME = :input
  TYPE = :submit
  DEFAULT_VALUE = 'Save'

  attr_reader :value

  def initialize(**attributes)
    @value = attributes[:value]
  end

  def build_html
    HexletCode::HtmlTag.build(tag_name, field_attributes)
  end

  private

  def field_attributes
    @field_attributes ||= {
      type: TYPE,
      value: value || DEFAULT_VALUE
    }
  end

  def tag_name
    TAG_NAME
  end
end
