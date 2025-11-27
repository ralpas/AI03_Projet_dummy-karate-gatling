Feature: Lecture des produits

  Background:
    * url karate.properties['baseUrl'] || 'http://localhost:3000'

  Scenario: JSON Structure Validation
    Given path 'carts'
    When method get
    Then status 200
    * def cartSchema =
    """
    {
      "id": "#number",
      "total": "#number",
      "discountedTotal": "#number",
      "userId": "#number",
      "totalProducts": "#number",
      "totalQuantity": "#number",
      "products": "#[] #object"
    }
    """
    And match response == '#[] cartSchema'

  Scenario Outline: 
    Given path 'users/<id>'
    When method get
    Then status 200
    And match response.lastName == <lastname>

    Examples:
    | id |  lastname   | 
    | 1  |  'Johnson'  |
    | 2  |  'Williams' |
    | 3  |  'Brown'    |
 