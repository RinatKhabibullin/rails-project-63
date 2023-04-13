# frozen_string_literal: true

class TextareaElement
  AS = :text
  TAG_NAME = :textarea
  DEFAULT_ATTRIBUTES = { cols: '20', rows: '40' }.freeze

  attr_reader :object, :name, :attributes

  def self.build(**attributes)
    new(**attributes).build
  end

  def initialize(**attributes)
    @name = attributes[:name]
    @object = attributes[:object]
    @attributes = attributes.except(:name, :object)
  end

  def build
    HexletCode::Tag.build(tag_name, element_attributes) { object.public_send(name) }
  end

  private

  def element_attributes
    @element_attributes ||= {
      **attributes,
      name:
    }.merge(DEFAULT_ATTRIBUTES) { |_key, first, _second| first }
  end

  def tag_name
    TAG_NAME
  end
end
