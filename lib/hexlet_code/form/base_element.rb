# frozen_string_literal: true

class BaseElement
  attr_reader :object, :name, :attributes

  def self.build(object, name, **attributes, &block)
    new(object, name, **attributes, &block).build
  end

  def initialize(object, name, **attributes)
    @object = object
    @name = name
    @attributes = attributes
  end

  def build
    HexletCode::Tag.build(tag_name, element_attributes) { object.public_send(name) }
  end

  private

  def element_attributes
    NotImplementedError
  end

  def tag_name
    NotImplementedError
  end
end
