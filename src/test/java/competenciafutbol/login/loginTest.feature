Feature: Test Login

  Background:
    * url 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCIo2wOm-kS6B1JjvTQDl6oAoY_AQTB8Qg'
    * def bodyLogin = read ('bodyLogin.json')

  Scenario: Login OK
    And set bodyLogin.email = 'stivenjcr@gmail.com'
    And set bodyLogin.password = '123456'
    And request bodyLogin
    When method post
    Then status 200

  Scenario: Invalid login credentials
    And set bodyLogin.email = 'uninorte@gmail.com'
    And set bodyLogin.password = 'uninorte'
    And request bodyLogin
    When method post
    Then status 400
    And match response.error.message == 'INVALID_LOGIN_CREDENTIALS'

  Scenario: Password is empty
    And set bodyLogin.email = 'uninorte@gmail.com'
    And set bodyLogin.password = ''
    And request bodyLogin
    When method post
    Then status 400
    And match response.error.message == 'MISSING_PASSWORD'

  Scenario: Email is empty
    And set bodyLogin.email = ''
    And set bodyLogin.password = 'asde'
    And request bodyLogin
    When method post
    Then status 400
    And match response.error.message == 'INVALID_EMAIL'

