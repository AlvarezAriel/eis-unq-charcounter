require_relative '../../app/models/Board.rb'

Given(/^a board with dimensions "(.*?)" x "(.*?)"$/) do |width, height|
  @board = Board.new arg1, arg2
end

Given(/^I create a small ship in position "([0-9]+?):([0-9]+?)"$/) do |x,y|
  @board
end

Then(/^position "([0-9]+?):([0-9]+?)" is not empty$/) do |x,y|
  @board.is_water_at?(x,y).should be false
end

And(/^a large ship in position: "([0-9]+?):([0-9]+?)"$/) do |x,y|
  pending
end

Given(/^I shoot to position "([0-9]+?):([0-9]+?)"$/) do |x,y|
  pending
end

Then(/^I get hit$/) do
  pending
end

Then(/^I get water$/) do
  pending
end

Then(/^I get sink$/) do
  pending
end