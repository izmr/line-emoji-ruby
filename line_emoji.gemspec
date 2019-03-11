
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "line_emoji/version"

Gem::Specification.new do |spec|
  spec.name          = "line_emoji"
  spec.version       = LineEmoji::VERSION
  spec.authors       = ["izmr"]
  spec.email         = ["tatsuya.izumori@gmail.com"]

  spec.summary       = %q{Encode texts for sending messages includeing LINE's emoji.}
  spec.description   = %q{LineEmoji is a text encoder for sending messages including LINE's emoji via "Line Messaging API"}
  spec.homepage      = "https://github.com/izmr/line-emoji-ruby"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "json", "~> 2.1.0"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
