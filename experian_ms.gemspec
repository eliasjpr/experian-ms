require File.expand_path('../lib/experian_ms/version', __FILE__)

Gem::Specification.new do |s|
  s.name          = "experian_ms"
  s.version       = ExperianMS::VERSION.dup
  s.author        = "Elias J. Perez"
  s.email         = "eperez@pinch.me"
  s.homepage      = "https://github.com/eliasjpr/experian-ms"
  s.summary       = "A Ruby wrapper that Integrates Experian Marketing Suite endpoints."
  s.description   =  %q{The Experian Marketing Suite is the world's most flexible
    and comprehensive cloud-based marketing platform. More than 10,000 of the world's
    leading brands, in over than 30 countries, are using the Experian Marketing Suite
    to create and deliver intelligent interactions with their customers, every time.

    Built from the ground-up leveraging 30 years of data-driven global marketing expertise,
    the award-winning Experian Marketing Suite unites Experian's customer identity,
    analytics and cross-channel marketing technology..}

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.licenses      = ['MIT']
  s.platform      = Gem::Platform::RUBY
  s.rubyforge_project = s.name

  s.add_runtime_dependency 'httparty', '~> 0.13'

  s.add_development_dependency 'rake', '~> 11.1'
  s.add_development_dependency 'vcr', '~> 3.0'
  s.add_development_dependency 'rspec', '~> 3.4'
  s.add_development_dependency 'webmock', '~> 2.1'
end
