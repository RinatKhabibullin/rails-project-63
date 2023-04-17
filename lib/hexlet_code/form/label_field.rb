# frozen_string_literal: true

class LabelField
  TAG_NAME = :label

  attr_reader :object, :name

  def initialize(**attributes)
    @name = attributes[:name]
    @object = attributes[:object]
  end

  def build_html
    HexletCode::HtmlTag.build(tag_name, field_attributes) { object.public_send(name) }
  end

  private

  def field_attributes
    @field_attributes ||= {
      for: name
    }
  end

  def tag_name
    TAG_NAME
  end
end
