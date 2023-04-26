# frozen_string_literal: true

module HexletCode
  class TextareaField < Tag
    DEFAULT_ATTRIBUTES = { cols: '20', rows: '40' }.freeze

    attr_reader :name

    def initialize(name:, object:, **attributes)
      super
      @attributes = attributes
      @name = name
      @tag_name = :textarea
      @body << object.public_send(name)
    end

    def tag_attributes
      @tag_attributes ||= {
        **attributes,
        name:
      }.merge(DEFAULT_ATTRIBUTES) { |_key, first, _second| first }
    end
  end
end
