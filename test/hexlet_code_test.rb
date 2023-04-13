# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "minitest/autorun"
require "hexlet_code"

class HexletCodeTest < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @user = User.new name: "rob", job: "hexlet", gender: "m"
  end

  def test_form_for_without_url
    form = HexletCode.form_for @user do |f|
    end

    html_fixture = File.read(File.expand_path("fixtures/test_form_for_without_url.html", __dir__))
    assert_equal html_fixture, form
  end

  def test_form_for_with_url
    form = HexletCode.form_for @user, url: "/users" do |f|
    end

    html_fixture = File.read(File.expand_path("fixtures/test_form_for_with_url.html", __dir__))
    assert_equal html_fixture, form
  end

  def test_form_for_with_input
    form = HexletCode.form_for @user, url: "#" do |f|
      f.input :name, class: "user-input"
      f.input :job
      f.submit
    end

    html_fixture = File.read(File.expand_path("fixtures/test_form_for_with_input.html", __dir__))
    assert_equal html_fixture, form
  end

  def test_form_for_with_textarea
    form = HexletCode.form_for @user, url: "#" do |f|
      f.input :job, as: :text, rows: 50, cols: 50
      f.submit "Wow"
    end

    html_fixture = File.read(File.expand_path("fixtures/test_form_for_with_textarea.html", __dir__))
    assert_equal html_fixture, form
  end

  def test_form_for_with_no_attributes_textarea
    form = HexletCode.form_for @user do |f|
      f.input :job, as: :text
    end

    html_fixture = File.read(File.expand_path("fixtures/test_form_for_with_no_attributes_textarea.html", __dir__))
    assert_equal html_fixture, form
  end

  def test_unexisted_field
    assert_raises NoMethodError do
      HexletCode.form_for @user, url: "/users" do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end
  end
end
