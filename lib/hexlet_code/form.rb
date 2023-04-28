# frozen_string_literal: true

module HexletCode
  class Form < Tag
    DEFAULT_METHOD = :post
    DEFAULT_ACTION = '#'

    attr_reader :object, :action

    def initialize(object:, action:, **attributes)
      super
      @object = object
      @action = action || DEFAULT_ACTION
      @attributes = attributes
      @tag_name = :form
    end

    def tag_attributes
      @tag_attributes ||= {
        action:,
        method: DEFAULT_METHOD,
        **attributes
      }
    end

    def input(name, as: :input, **attributes)
      body << LabelField.new(object:, name:)
      body << "HexletCode::#{as.capitalize}Field".constantize.new(object:, name:, **attributes)
    end

    def submit(value = nil)
      body << SubmitField.new(value:)
    end
  end
end
