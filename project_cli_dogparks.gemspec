# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'project_cli_dogparks/version'

Gem::Specification.new do |spec|
  spec.name          = "project_cli_dogparks"
  spec.version       = ProjectCliDogparks::VERSION
  spec.authors       = ["Jonathan Stone"]
  spec.email         = ["jon_p_stone@yahoo.com"]

  spec.summary       = %q{A gem for discovering off leash dog parks in the Plano, TX area.}
  spec.homepage      = "https://github.com/jonpstone/project-cli-dogparks.git."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
end
