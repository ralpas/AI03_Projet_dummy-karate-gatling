Feature: Performance Test - Get Users

  Background:
    # On récupère l'URL passée par la simulation Gatling (via le système)
    * url karate.properties['baseUrl'] || 'http://localhost:3000'

  @name=get-users
  Scenario: Récupérer la liste des utilisateurs
    Given path 'users'
    When method get
    Then status 200