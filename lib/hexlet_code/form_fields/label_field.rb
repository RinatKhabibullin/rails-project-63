# frozen_string_literal: true

module HexletCode
  class LabelField < Tag
    attr_reader :name

    def initialize(name:, object:)
      super
      @name = name
      @body << object.public_send(name)
    end

    def field_attributes
      @field_attributes ||= {
        for: name
      }
    end

    def tag_name
      :label
    end
  end
end
