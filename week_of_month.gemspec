require File.expand_path('../lib/modules/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'week_of_month'
  s.version     = WeekOfMonth::VERSION
  s.date        = '2014-04-27'
  s.summary     = "Week Of Month!"
  s.description = "Its gives you week_of_month method on date and time objects, that returns week of the month."
  s.authors     = ["Sachin Singh"]
  s.email       = ['sachin@railsdeveloper.in', 'sachin.y87@gmail.com', 'singhsachin87@yahoo.com']
  s.homepage    = 'https://github.com/sachin87/week-of-month'
  s.files         = `git ls-files`.split("\n").sort
  s.require_paths = ["lib"]
  s.license = 'MIT'
  s.add_development_dependency 'rake', '>= 10.1.0'
end
