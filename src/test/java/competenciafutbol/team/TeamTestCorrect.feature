Feature: Test Team With Authentication

  Background:
    * def id = 1
    * def id_incorrect = 999999
    * def bodyLogin = read('../login/bodyLogin.json')

  Scenario: Login OK
    Given url 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCIo2wOm-kS6B1JjvTQDl6oAoY_AQTB8Qg'
    And set bodyLogin.email = 'stivenjcr@gmail.com'
    And set bodyLogin.password = '123456'
    And request bodyLogin
    When method post
    Then status 200

  Scenario: getData for teams OK
    Given url 'http://localhost:4000'
    And path 'api/data'
    When method get
    Then status 200

  Scenario: getData for teams - incorrect url
    Given url 'http://localhost:4000'
    And path 'api/data-all'
    When method get
    Then status 404

  Scenario: getData by id team OK
    Given url 'http://localhost:4000'
    And path 'api/posiciones/' + id
    When method get
    Then status 200

  Scenario: getData by id team incorrect
    Given url 'http://localhost:4000'
    And path 'api/posiciones/' + id_incorrect
    When method get
    Then status 404
    And match response.message == 'Equipo no encontrado'


