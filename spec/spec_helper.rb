ENV["RACK_ENV"] = "test"

require "capybara/rspec"

require "./app"
require "capybara/rspec"

Capybara.app = App