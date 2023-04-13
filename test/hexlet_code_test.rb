# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "minitest/autorun"
require "hexlet_code"

class HexletCodeTest < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @user = User.new name: "rob", job: "hexlet", gender: "m"
  end

  def test_form_for_with_action
    form = HexletCode.form_for @user, url: "/users" do |f|
      f.input :name, class: "user-input"
      f.input :job
      f.input :job, as: :text, rows: 50, cols: 50
      f.input :job, as: :text
      f.submit
      f.submit "Wow"
    end

    html_fixture = File.read(File.expand_path("fixtures/form_with_action.html", __dir__))

    assert_equal form, html_fixture
  end

  def test_form_for_without_action
    form = HexletCode.form_for @user do |f|
      f.input :name, class: "user-input"
      f.input :job
      f.input :job, as: :text, rows: 50, cols: 50
      f.input :job, as: :text
      f.submit
      f.submit "Wow"
    end

    html_fixture = File.read(File.expand_path("fixtures/form_without_action.html", __dir__))

    assert_equal form, html_fixture
  end

  def test_form_for_with_unexisted_field
    assert_raises NoMethodError do
      HexletCode.form_for @user, url: "/users" do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end
  end
end
