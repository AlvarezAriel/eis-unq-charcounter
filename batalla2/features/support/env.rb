require File.expand_path(File.dirname(__FILE__) + "/../../config/boot")
require_relative '../../app/app.rb'

require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'rspec/expectations'

require 'simplecov'
SimpleCov.start do
  root(File.join(File.dirname(__FILE__), '..','..'))
  coverage_dir 'reports/coverage'
  add_filter '/spec/'
  add_filter '/features/'
  add_filter '/admin/'
  add_filter '/db/'
  add_filter '/config/'
  add_group "Models", "app/models"
  add_group "Controllers", "app/controllers"
  add_group "Helpers", "app/helpers"
end

Capybara.javascript_driver = :poltergeist
Capybara.default_driver = :poltergeist
Capybara.app = Rack::Directory.new('spec/public')
Capybara.default_wait_time = 2
Capybara::Angular.default_wait_time = 10

Capybara.app = Battleship::App.tap { |app|  }
Capybara.ignore_hidden_elements = false
