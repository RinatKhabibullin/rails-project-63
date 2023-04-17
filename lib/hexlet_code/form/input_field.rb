# frozen_string_literal: true

class InputField
  AS = :input
  TAG_NAME = :input
  TYPE = :text

  attr_reader :object, :name, :attributes

  def initialize(**attributes)
    @name = attributes[:name]
    @object = attributes[:object]
    @attributes = attributes.except(:name, :object)
  end

  def build_html
    HexletCode::HtmlTag.build(tag_name, field_attributes)
  end

  private

  def field_attributes
    @field_attributes ||= {
      name:,
      type: TYPE,
      value: object.public_send(name),
      **attributes
    }
  end

  def tag_name
    TAG_NAME
  end
end
