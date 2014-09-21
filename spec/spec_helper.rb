require "pry"
require "faraday"
require "webmock/rspec"
require "faraday_middleware"
require "json"
require "rspec-do_action"

require 'bundler/setup'
Bundler.setup

RSpec.configure do |config|
  # some (optional) config here
end

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "ip2address"