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
  s.summary     = "A rails plugs-in which can paginate data by time period."
  s.description = "A rails plugs-in which can paginate data by time period. It will help you to improve your application performance especially when your data is orgnized by time partition."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'activesupport', ['>= 3.0.0']
  s.add_dependency 'actionpack', ['>= 3.0.0']

  s.add_development_dependency 'rails', ['>= 3.0.0']
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails', ['>= 3.0.0']
  s.add_development_dependency 'rspec-parameterized', ['>= 0']
  s.add_development_dependency 'factory_girl_rails', ['>= 0']
end
