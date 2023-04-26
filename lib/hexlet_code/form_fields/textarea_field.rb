# frozen_string_literal: true

module HexletCode
  class TextareaField < Tag
    DEFAULT_ATTRIBUTES = { cols: '20', rows: '40' }.freeze

    attr_reader :name, :attributes

    def initialize(name:, object:, **attributes)
      super
      @attributes = attributes
      @name = name
      @body << object.public_send(name)
    end

    def field_attributes
      @field_attributes ||= {
        **attributes,
        name:
      }.merge(DEFAULT_ATTRIBUTES) { |_key, first, _second| first }
    end

    def tag_name
      :textarea
    end
  end
end
