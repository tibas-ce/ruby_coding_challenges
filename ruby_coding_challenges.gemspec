require_relative "lib/ruby_coding_challenges/version"

Gem::Specification.new do |spec|
  spec.name          = "ruby_coding_challenges"
  spec.version       = RubyCodingChallenges::VERSION
  spec.authors       = ["Tibério dos Santos Ferreira"]
  spec.email         = ["tiberio.ferreiracs@gmail.com"]

  spec.summary       = "Algoritmos e desafios em Ruby"
  spec.description   = "Implementações de algoritmos como aprendizado."
  spec.homepage      = "https://github.com/tibas-ce/ruby_coding_challenges"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 3.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.files = Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]
end
