# frozen_string_literal: true

autoload(:BaseElement, File.expand_path("base_element.rb", __dir__))

class InputElement < BaseElement
  AS = :input
  TAG_NAME = :input

  private

  def element_attributes
    @element_attributes ||= {
      name: name,
      type: "text",
      value: object.public_send(name),
      **attributes
    }
  end

  def tag_name
    TAG_NAME
  end
end
