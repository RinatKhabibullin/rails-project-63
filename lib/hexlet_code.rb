# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  autoload(:Form, File.expand_path("hexlet_code/form.rb", __dir__))

  class Error < StandardError; end

  def self.form_for(object, url: "#", &block)
    HexletCode::Form.build(object, url, &block)
  end
end
