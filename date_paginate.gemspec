$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "date_paginate/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "date_paginate"
  s.version     = DatePaginate::VERSION
  s.authors     = ["SmileZero"]
  s.email       = ["chen_0_1987@163.com"]
  s.homepage    = "https://github.com/SmileZero/date_paginate"
  s.summary     = "TODO: Summary of DatePaginate."
  s.description = "TODO: Description of DatePaginate."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0"

  s.add_dependency 'activesupport', ['>= 3.0.0']
  s.add_dependency 'actionpack', ['>= 3.0.0']

  s.add_development_dependency 'bundler', ['>= 1.0.0']
  s.add_development_dependency 'rake', ['>= 0']
  s.add_development_dependency 'rspec', ['>= 0']
  s.add_development_dependency 'capybara', ['>= 1.0']
  s.add_development_dependency 'database_cleaner', ['~> 1.2.0']
  s.add_development_dependency 'rdoc', ['>= 0']
end
