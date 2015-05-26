require_relative '../../app/models/Board.rb'
include Capybara::Angular::DSL

Given(/^a board with dimensions "([0-9]+)" x "([0-9]+)"$/) do |width, height|
  visit "/game?width=#{width}&height=#{height}"
end

Given(/^(?:I create )?a (large|small) ship in position "([0-9]+):([0-9]+)"$/) do |ship_type, x,y|
  select "Put #{ship_type} ship", from: 'action_selector'
  find("\#cell-#{x}-#{y}").click
end

Then(/^position "([0-9]+):([0-9]+)" is not empty$/) do |x,y|
  find("\#cell-#{x}-#{y}")[:class].include?('ship').should be true
end

Given(/^I shoot to position "([0-9]+):([0-9]+)"$/) do |x,y|
  @shoot_position = [x,y]
  @board.shoot_at(x,y)
end

Then(/^I get hit$/) do
  @ship.is_hit?.should be true
end

Then(/^I get water$/) do
  @board.is_water_at?(@shoot_position[0], @shoot_position[1]).should be true
end

Then(/^I get sink$/) do
  @ship.is_sink?.should be true
end

Then(/^an error should be thrown$/) do
  @error.should_not be_nil
end

Transform /^(-?\d+)$/ do |number|
  number.to_i
end

