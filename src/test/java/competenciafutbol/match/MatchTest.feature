Feature: Test Match

  Background:
    * url 'http://localhost:4000'
    * def bodyMatch = read ('bodyMatch.json')

  Scenario: getMatch for teams OK
    Given path 'api/partidos'
    When method get
    Then status 200

  Scenario: getData for teams - incorrect url
    Given path 'api/partido'
    When method get
    Then status 404

  Scenario: getData for positions teams
    Given path 'api/tabla-posiciones'
    When method get
    Then status 200
