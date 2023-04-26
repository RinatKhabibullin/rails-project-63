# frozen_string_literal: true

module HexletCode
  class LabelField < Tag
    attr_reader :name

    def initialize(name:, object:)
      super
      @name = name
      @tag_name = :label
      @body << object.public_send(name)
    end

    def tag_attributes
      @tag_attributes ||= {
        for: name
      }
    end
  end
end
