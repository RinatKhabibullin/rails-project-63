# frozen_string_literal: true

autoload(:BaseElement, File.expand_path("base_element.rb", __dir__))

class LabelElement < BaseElement
  TAG_NAME = :label

  attr_reader :object, :name

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
