# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  autoload(:Tag, "hexlet_code/tag.rb")

  class Error < StandardError; end

  def self.form_for(_user, url: "#")
    attributes = { action: url, method: "post" }.compact

    HexletCode::Tag.build("form", attributes)
  end
end
