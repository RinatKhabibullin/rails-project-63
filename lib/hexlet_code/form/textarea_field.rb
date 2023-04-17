# frozen_string_literal: true

class TextareaField
  AS = :text
  TAG_NAME = :textarea
  DEFAULT_ATTRIBUTES = { cols: '20', rows: '40' }.freeze

  attr_reader :object, :name, :attributes

  def initialize(**attributes)
    @name = attributes[:name]
    @object = attributes[:object]
    @attributes = attributes.except(:name, :object)
  end

  def build_html
    HexletCode::HtmlTag.build(tag_name, field_attributes) { object.public_send(name) }
  end

  private

  def field_attributes
    @field_attributes ||= {
      **attributes,
      name:
    }.merge(DEFAULT_ATTRIBUTES) { |_key, first, _second| first }
  end

  def tag_name
    TAG_NAME
  end
end
