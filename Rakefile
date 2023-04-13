# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rubocop/rake_task'
require 'minitest/test_task'

Minitest::TestTask.create(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.warning = false
  t.test_globs = ['test/**/*_test.rb']
end

RuboCop::RakeTask.new

task default: %i[rubocop test]
