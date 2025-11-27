Feature: Lecture des produits

  Background:
    * url karate.properties['baseUrl'] || 'http://localhost:3000'

  Scenario: Récupérer tous les produits
    Given path 'products'
    When method get
    Then status 200
    And match response == '#[]'

  Scenario: Récupérer un produit spécifique (ID 1)
    Given path 'products', 1
    When method get
    Then status 200
    And match response.id == 1