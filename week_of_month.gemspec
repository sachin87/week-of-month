Gem::Specification.new do |s|
  s.name        = 'week_of_month'
  s.version     = '1.2.1'
  s.date        = '2012-10-08'
  s.summary     = "Week Of Month!"
  s.description = "Its gives you week_of_month method on date and time objects, that returns week of the month."
  s.authors     = ["Sachin Singh"]
  s.email       = 'sachin@railsdeveloper.in'
  s.files       = ["lib/week_of_month.rb", "lib/modules/*.rb", "lib/test/test_week_of_month_for_date_object.rb", "lib/test/                   test_week_of_month_for_time_object.rb"]
  s.homepage    = 'http://rubygems.org/gems/week_of_month'
  s.sourcecode  = 'https://github.com/sachin87/week-of-month'
  s.summary     = %q{}

  s.files         = `git ls-files`.split("\n").sort
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
end
