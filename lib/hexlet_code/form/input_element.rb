# frozen_string_literal: true

autoload(:BaseElement, File.expand_path('base_element.rb', __dir__))

class InputElement < BaseElement
  AS = :input
  TAG_NAME = :input
  TYPE = :text

  attr_reader :object, :name, :attributes

  def initialize(**attributes)
    @name = attributes[:name]
    @object = attributes[:object]
    @attributes = attributes.except(:name, :object)
  end

  def build
    HexletCode::Tag.build(tag_name, element_attributes)
  end

  private

  def element_attributes
    @element_attributes ||= {
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
