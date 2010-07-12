# ---- requirements
require 'rubygems'
require 'rspec'
require 'active_record'

$:.unshift File.expand_path('../lib', __FILE__)

# ---- setup environment/plugin
ActiveRecord::Base.establish_connection({
  :adapter => "sqlite3",
  :database => ":memory:",
})

#ActiveRecord::Base.logger = Logger.new(STDOUT)

require File.expand_path("../init", File.dirname(__FILE__))

