# frozen_string_literal: true

require_relative 'lib/form_builder/version'

Gem::Specification.new do |spec|
  spec.name          = 'form_builder'
  spec.version       = FormBuilder::VERSION
  spec.authors       = ['Evgeny Bukharov']
  spec.email         = ['bukharovev@gmail.com']

  spec.summary       = 'simple form_builder'
  spec.homepage      = 'https://github.com/bukharovev/rails-project-lvl1'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 3.0.1'

  spec.metadata['allowed_push_host'] = 'http://mygemserver.com'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/bukharovev/rails-project-lvl1'
  spec.metadata['changelog_uri'] = 'https://github.com/bukharovev/rails-project-lvl1'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
