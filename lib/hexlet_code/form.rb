# frozen_string_literal: true

module HexletCode
  class Form < Tag
    DEFAULT_METHOD = :post
    DEFAULT_ACTION = '#'
    INPUT_TAG_CLASS_MAPPER = {
      input: InputField,
      text: TextareaField
    }.freeze

    attr_reader :object, :action, :attributes

    def initialize(object:, action:, **attributes)
      super
      @object = object
      @action = action || DEFAULT_ACTION
      @attributes = attributes
    end

    def field_attributes
      @field_attributes ||= {
        action:,
        method: DEFAULT_METHOD,
        **attributes
      }
    end

    def input(name, as: :input, **attributes)
      body << LabelField.new(object:, name:)
      body << INPUT_TAG_CLASS_MAPPER[as.to_sym].new(object:, name:, **attributes)
    end

    def submit(value = nil)
      body << SubmitField.new(value:)
    end

    def tag_name
      :form
    end
  end
end
