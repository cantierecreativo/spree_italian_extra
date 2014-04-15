# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_italian_extra'
  s.version     = '2.2.0'
  s.summary     = 'Add extras for italy'
  s.description = "Add 'codice_fiscale/piva' field to user and other features"
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'David Librera, Francesco Disperati'
  s.email     = 'fradispe@gmail.com, davidlibrera@gmail.com'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.2.0'
  s.add_dependency 'rails-i18n'

  s.add_development_dependency 'capybara', '~> 2.2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'factory_girl', '~> 4.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.14'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'sqlite3'
end
