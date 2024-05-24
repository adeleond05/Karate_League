Feature: Test Team Without Authentication

  Background:
    * def id = 1
    * def id_incorrect = 999999
    * def bodyLogin = read('../login/bodyLogin.json')

  Scenario: Invalid login credentials
    Given url 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCIo2wOm-kS6B1JjvTQDl6oAoY_AQTB8Qg'
    And set bodyLogin.email = 'uninorte@gmail.com'
    And set bodyLogin.password = 'uninorte'
    And request bodyLogin
    When method post
    Then status 400
    And match response.error.message == 'INVALID_LOGIN_CREDENTIALS'

  Scenario: getData for teams with Failed Authentication
    Given url 'http://localhost:4000'
    And path 'api/data'
    When method get
    Then status 400

  Scenario: getData by id team with Failed Authentication
    Given url 'http://localhost:4000'
    And path 'api/posiciones/' + id
    When method get
    Then status 400


