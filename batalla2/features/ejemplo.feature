Feature: visita de pagina

Scenario: unico

  Given I visit mipagina
  When I enter "nicopaez"
  Then I want to see "nicopaez"