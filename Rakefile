require 'rake'
require 'rspec/core/rake_task'

begin
  username = 'teonimesic'
  project_name = 'translated_attributes'
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "#{username}-#{project_name}"
    gem.summary = "An adaptation of grossers's translatable attributes"
    gem.email = "stefano.diem@gmail.com"
    gem.homepage = "http://github.com/teonimesic/#{project_name}"
    gem.authors = ["Michael Grosser","Stefano Diem Benatti"]
    gem.add_dependency 'activerecord', '>= 3.0.0.beta4'
    gem.add_development_dependency "rspec-core", ">= 2.0.0.beta.13"
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

RSpec::Core::RakeTask.new(:spec)
task :default => :spec
