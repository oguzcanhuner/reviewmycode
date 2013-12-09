ENV['RACK_ENV'] ||= 'development'
require "rubygems"
require "bundler/setup"

root = File.dirname(__FILE__)
require File.expand_path(File.join(root, 'app.rb'))

run ReviewMyCode
