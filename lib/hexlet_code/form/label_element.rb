# frozen_string_literal: true

autoload(:BaseElement, File.expand_path("base_element.rb", __dir__))

class LabelElement < BaseElement
  TAG_NAME = :label

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
