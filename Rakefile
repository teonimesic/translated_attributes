task :default => :spec
require 'spec/rake/spectask'
Spec::Rake::SpecTask.new {|t| t.spec_opts = ['--color']}

begin
  project_name = 'translated_attributes'
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = project_name
    gem.summary = "An adaptation of grossers's translatable attributes"
    gem.email = "stefano.diem@gmail.com"
    gem.homepage = "http://github.com/teonimesic/#{project_name}"
    gem.authors = ["Michael Grosser","Stefano Diem Benatti"]
    gem.add_dependency ['activerecord']
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
