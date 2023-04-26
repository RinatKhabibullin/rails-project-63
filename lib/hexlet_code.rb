# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:Form, File.expand_path('hexlet_code/form.rb', __dir__))
  autoload(:HtmlBuilder, File.expand_path('hexlet_code/html_builder.rb', __dir__))
  autoload(:Tag, File.expand_path('hexlet_code/tag.rb', __dir__))
  autoload(:InputField, File.expand_path('hexlet_code/form_fields/input_field.rb', __dir__))
  autoload(:TextareaField, File.expand_path('hexlet_code/form_fields/textarea_field.rb', __dir__))
  autoload(:LabelField, File.expand_path('hexlet_code/form_fields/label_field.rb', __dir__))
  autoload(:SubmitField, File.expand_path('hexlet_code/form_fields/submit_field.rb', __dir__))

  class Error < StandardError; end

  def self.form_for(object, url: nil, **attributes)
    form = Form.new(object:, action: url, **attributes)
    yield(form)
    HtmlBuilder.build(form)
  end
end
