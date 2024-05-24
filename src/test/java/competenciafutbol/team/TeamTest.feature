Feature: Test Team

  Background:
    * url 'http://localhost:4000'
    * def bodyTeam = read ('bodyTeam.json')
    * def id = 1
    * def id_incorrect = 999999

  Scenario: getData for teams OK
    Given path 'api/data'
    When method get
    Then status 200

  Scenario: getData for teams - incorrect url
    Given path 'api/data-all'
    When method get
    Then status 404

  Scenario: getData by id team OK
    Given path 'api/posiciones/' + id
    When method get
    Then status 200

  Scenario: getData by id team OK
    Given path 'api/posiciones/' + id_incorrect
    When method get
    Then status 404
    And match response.message == 'Equipo no encontrado'

  Scenario: getData by id team OK
    Given path 'api/posiciones/' + id_incorrect
    When method get
    Then status 404
    And match response.message == 'Equipo no encontrado'

