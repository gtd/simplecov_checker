#!/usr/bin/env ruby
#
require 'simplecov'

SimpleCov.start
SimpleCov.command_name "tests"

require_relative 'app/models/user.rb'
require_relative 'app/base.rb'

# Now run "tests"
User.new.name
User.new.email
