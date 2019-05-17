# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fam/version'

Gem::Specification.new do |spec|
  spec.name          = 'fam'
  spec.version       = Fam::VERSION
  spec.authors       = ['Sebastian Sangervasi']
  spec.email         = ['ssangervasi@squareup.com']

  spec.summary       = 'A family tree builder - Made for Telefactor'
  spec.homepage      = 'https://github.com/ssangervasi/telefactor'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  ## Dependencies
  spec.add_dependency 'tty-prompt'
end
