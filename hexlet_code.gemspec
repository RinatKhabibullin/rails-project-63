# frozen_string_literal: true

require_relative 'lib/hexlet_code/version'

Gem::Specification.new do |spec|
  spec.name = 'hexlet_code'
  spec.version = HexletCode::VERSION
  spec.authors = ['Rinat Khabibullin']
  spec.email = ['rinat.khabibullin@dualbootpartners.com']

  spec.summary = 'hexlet ruby on rails first project'
  spec.description = 'form generator'
  spec.homepage = 'https://github.com/RinatKhabibullin/rails-project-63'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.1.2'

  spec.metadata['allowed_push_host'] = 'https://github.com'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/RinatKhabibullin/rails-project-63'
  spec.metadata['changelog_uri'] = 'https://github.com/RinatKhabibullin/rails-project-63/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'
  spec.add_dependency 'minitest'
  spec.add_dependency 'rake'
  spec.add_dependency 'rubocop'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata['rubygems_mfa_required'] = 'true'
end
