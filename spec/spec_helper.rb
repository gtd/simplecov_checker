if ENV['CODECLIMATE_REPO_TOKEN']
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
else
  require 'simplecov'
  SimpleCov.start
end

system('cd spec/fixtures && ./generate_coverage.rb')

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov_checker'
