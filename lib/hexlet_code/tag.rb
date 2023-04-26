# frozen_string_literal: true

module HexletCode
  class Tag
    attr_reader :body

    def initialize(**_attributes)
      @body = []
    end

    def field_attributes
      NotImplementedError
    end

    def tag_name
      NotImplementedError
    end
  end
end
