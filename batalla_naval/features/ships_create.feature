Feature: Ships create

  Background:
    Given a board with dimensions "5" x "5"

  Scenario: Create a small ship out of the board
    When I create a small ship in position "6:6"
    Then an error should be thrown

  Scenario: Create a large ship on the limit of the board
    When I create a large ship in position "4:4"
    Then an error should be thrown

  Scenario: Create a small ship over another ship
    When I create a small ship in position "3:3"
    And  I create a small ship in position "3:3"
    Then an error should be thrown

  Scenario: Create a small ship in a valid location
    Given I create a small ship in position "3:3"
    Then position "3:3" is not empty
