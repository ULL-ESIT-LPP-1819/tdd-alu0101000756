
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nutrientesEugenio/version"

Gem::Specification.new do |spec|
  spec.name          = "nutrientesEugenio"
  spec.version       = NutrientesEugenio::VERSION
  spec.authors       = ["Eugenio José"]
  spec.email         = ["alu0101000756@ull.edu.es"]

  spec.summary       = %q{"Clase para gestionar los glúcidos, lípidos y proteínas de un alimento específico"}
  spec.homepage      = "https://github.com/ULL-ESIT-LPP-1819/tdd-alu0101000756.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = 'https://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end