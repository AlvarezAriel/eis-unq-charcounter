require_relative '../../../batalla_naval/app/models/Board'
include Capybara::Angular::DSL

Given(/^a board with dimensions "([0-9]+)" x "([0-9]+)"$/) do |width, height|
  visit "/game?width=#{width}&height=#{height}"
end

Given(/^(?:I create )?a (large|small) ship in position "([0-9]+):([0-9]+)"$/) do |ship_type, x,y|
  select "Put #{ship_type} ship", from: 'action_selector'
  get_cell(x, y).click
end

Then(/^position "([0-9]+):([0-9]+)" is not empty$/) do |x,y|
  get_cell(x, y)[:class].include?('ship').should be true
end

Given(/^I shoot to position "([0-9]+):([0-9]+)"$/) do |x,y|
  @shoot_position = [x,y]
  select 'Shoot', from: 'action_selector'
  get_cell(x, y).click
end

Then(/^I get (hit|sink)$/) do |status|
  (cell_includes_class status).should be true
end

Then(/^I get water$/) do
  (cell_includes_class 'ship').should be false
end

Then(/^an error should be thrown$/) do
  find('#error-text').text.should eq 'Invalid Action'
end

def get_cell(x, y)
  find("\#cell-#{x}-#{y}")
end

def cell_includes_class(css_class)
  get_cell(@shoot_position[0], @shoot_position[1])[:class].include?(css_class)
end

Transform /^(-?\d+)$/ do |number|
  number.to_i
end

