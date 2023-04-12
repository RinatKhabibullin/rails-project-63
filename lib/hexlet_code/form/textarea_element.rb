# frozen_string_literal: true

autoload(:BaseElement, File.expand_path("base_element.rb", __dir__))

class TextareaElement < BaseElement
  AS = :text
  TAG_NAME = :textarea
  DEFAULT_ATTRIBUTES = { cols: "20", rows: "40" }.freeze

  private

  def element_attributes
    @element_attributes ||= {
      **attributes,
      name: name
    }.merge(DEFAULT_ATTRIBUTES) { |_key, first, _second| first }
  end

  def tag_name
    TAG_NAME
  end
end
