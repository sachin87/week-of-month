# @author Sachin Singh

require File.expand_path('../lib/modules/version', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'week_of_month'
  s.version       = WeekOfMonth::VERSION
  s.summary       = 'Week of month!'
  s.description   = 'Its gives you week_of_month method on date and time objects, that returns week of the month.'
  s.authors = %w[Sachin87 Tommyixi Matt-- berikin pablorusso AstonJ swapnilchincholkar hitendrasingh ilake fursich]
  s.email         = %w[sachin.y87@gmail.com]
  s.homepage      = 'https://github.com/sachin87/week-of-month'
  s.files         = `git ls-files`.split("\n").sort
  s.require_paths = ['lib']
  s.license       = 'MIT'

  s.add_development_dependency 'rake', '>= 12.0.0'
  s.add_development_dependency 'bundler', '>= 1.15.4'
  s.add_development_dependency 'test-unit', '>= 3.2.5'
end
