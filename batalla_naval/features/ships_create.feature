Feature: Ships create

  Background:
    Given a board with dimensions "5" x "5"

  @wip
  Scenario: Create a small ship out of the board
    When I create a small ship in position "6:6"
    Then an error should be thrown

  Scenario: Create a small ship in a valid location
    Given I create a small ship in position "3:3"
    Then position "3:3" is not empty
