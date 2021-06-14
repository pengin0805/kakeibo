# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mini_portile2/version"

Gem::Specification.new do |spec|
  spec.name = "mini_portile2"
  spec.version = MiniPortile::VERSION

  spec.authors = ["Luis Lavena", "Mike Dalessio", "Lars Kanis"]
  spec.email = "mike.dalessio@gmail.com"

  spec.summary = "Simplistic port-like solution for developers"
  spec.description = "Simplistic port-like solution for developers. It provides a standard and simplified way to compile against dependency libraries without messing up your system."

  spec.homepage = "https://github.com/flavorjones/mini_portile"
  spec.licenses = ["MIT"]

  begin
    spec.files = `git ls-files -z`.split("\x0")
  rescue Exception => e
    warn "WARNING: could not set spec.files: #{e.class}: #{e}"
  end

  # omit the `examples` directory from the gem, because it's large and
  # not necessary to be packaged in the gem.
  example_files = spec.files.grep(%r{^examples/})
  spec.files -= example_files

  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features|examples)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "minitar", "~> 0.7"
  spec.add_development_dependency "minitest", "~> 5.11"
  spec.add_development_dependency "minitest-hooks", "~> 1.5.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "webrick", "~> 1.0"

  spec.required_ruby_version = ">= 2.3.0"
end
