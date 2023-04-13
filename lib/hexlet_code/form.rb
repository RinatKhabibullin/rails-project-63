# frozen_string_literal: true

module HexletCode
  autoload(:Tag, File.expand_path("tag.rb", __dir__))
  autoload(:InputElement, File.expand_path("form/input_element.rb", __dir__))
  autoload(:TextareaElement, File.expand_path("form/textarea_element.rb", __dir__))
  autoload(:LabelElement, File.expand_path("form/label_element.rb", __dir__))
  autoload(:SubmitElement, File.expand_path("form/submit_element.rb", __dir__))
  autoload(:PlaneStringToHtmlConverter, File.expand_path("plane_string_to_html_converter.rb", __dir__))

  class Form
    TAG_NAME = :form

    attr_reader :object, :attributes, :body

    def self.build(name, attributes = {}, &block)
      new(name, attributes, &block).build
    end

    def initialize(object, url)
      @object = object
      @attributes = { action: url, method: "post" }.compact
      @body = ""

      yield self
    end

    def input(name, as: :input, **attributes)
      @body += LabelElement.build(object: object, name: name)
      @body += InputElement.build(object: object, name: name, **attributes) if as.to_sym == InputElement::AS
      @body += TextareaElement.build(object: object, name: name, **attributes) if as.to_sym == TextareaElement::AS
    end

    def submit(value = nil)
      @body += SubmitElement.build(value: value)
    end

    def build
      plane_string = HexletCode::Tag.build(TAG_NAME, attributes) { body }
      HexletCode::PlaneStringToHtmlConverter.convert(plane_string)
    end
  end
end