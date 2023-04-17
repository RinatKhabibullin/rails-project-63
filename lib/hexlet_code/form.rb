# frozen_string_literal: true

module HexletCode
  autoload(:HtmlTag, File.expand_path('html_tag.rb', __dir__))
  autoload(:InputField, File.expand_path('form/input_field.rb', __dir__))
  autoload(:TextareaField, File.expand_path('form/textarea_field.rb', __dir__))
  autoload(:LabelField, File.expand_path('form/label_field.rb', __dir__))
  autoload(:SubmitField, File.expand_path('form/submit_field.rb', __dir__))

  class Form
    TAG_NAME = :form
    DEFAULT_METHOD = :post
    DEFAULT_ACTION = '#'
    INPUT_TAG_CLASS_MAPPER = {
      input: InputField,
      text: TextareaField
    }.freeze

    attr_reader :object, :attributes, :fields

    def self.build_html(name, url: DEFAULT_ACTION, **attributes, &block)
      new(name, url:, **attributes, &block).build_html
    end

    def initialize(object, url:, **attributes)
      @object = object
      @attributes = {
        action: url,
        method: DEFAULT_METHOD,
        **attributes
      }
      @fields = []

      yield self
    end

    def input(name, as: :input, **attributes)
      fields << LabelField.new(object:, name:)
      fields << INPUT_TAG_CLASS_MAPPER[as.to_sym].new(object:, name:, **attributes)
    end

    def submit(value = nil)
      fields << SubmitField.new(value:)
    end

    def build_html
      nested_html_tags = fields.map { |field| %(  #{field.build_html}\n) }.join
      HexletCode::HtmlTag.build(TAG_NAME, attributes) { %(\n#{nested_html_tags}) }
    end
  end
end
