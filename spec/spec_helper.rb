ENV["RACK_ENV"] = "test"
require "user_database"

require "capybara/rspec"

require "./app"

Capybara.app =


gem "sinatra-activerecord"