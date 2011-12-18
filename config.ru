require 'rubygems'
require 'bundler/setup'
require 'status_cats'

require File.expand_path('../spec/test_app', __FILE__)

use StatusCats
run TestApp.new
