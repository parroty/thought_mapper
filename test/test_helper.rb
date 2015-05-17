require "coveralls"
Coveralls.wear!

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start do
  add_filter "config"
end

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/pride"
require "minitest/rails/capybara"
require "minitest/reporters"
require "mocha/setup"
require "factory_girl_rails"

module ActiveSupport
  class TestCase
    fixtures :all
  end
end
