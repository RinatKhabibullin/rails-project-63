# frozen_string_literal: true

class LabelElement
  TAG_NAME = :label

  attr_reader :object, :name

  def self.build(**attributes)
    new(**attributes).build
  end

  def initialize(**attributes)
    @name = attributes[:name]
    @object = attributes[:object]
  end

  def build
    HexletCode::Tag.build(tag_name, element_attributes) { object.public_send(name) }
  end

  private

  def element_attributes
    @element_attributes ||= {
      for: name
    }
  end

  def tag_name
    TAG_NAME
  end
end
