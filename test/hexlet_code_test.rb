$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require "minitest/autorun"
require 'hexlet_code'

class HexletCodeTest < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def setup
    @user = User.new name: 'rob'
  end

  def test_form_for_without_url
    form = HexletCode.form_for @user do |f|
    end
    assert_equal %(<form action="#" method="post"></form>), form
  end

  def test_form_for_with_url
    form = HexletCode.form_for @user, url: '/users' do |f|
    end
    assert_equal %(<form action="/users" method="post"></form>), form
  end
end
