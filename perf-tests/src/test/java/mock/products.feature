Feature: Test CRUD sans Authentification

  Background:
    # URL de base
    * url karate.properties['baseUrl'] || 'http://localhost:3000'
    # PLUS BESOIN DE LOGIN, DE TOKEN, NI DE HEADER AUTHORIZATION !

  Scenario: 01 - Récupérer les produits
    Given path 'products'
    When method get
    Then status 200
    # On vérifie juste que l'API répond bien
    And match response == '#[]'

  Scenario: 02 - Créer un produit (POST)
    Given path 'products'
    And request { title: 'Karate Simple', price: 100 }
    When method post
    Then status 201
    And match response.id == '#present'
    * print '>>> PRODUIT CRÉÉ ID :', response.id

Scenario: 03 - Cycle de vie complet (Créer puis Supprimer)
    # 1. D'abord, on crée un produit "jetable"
    Given path 'products'
    And request { title: 'Produit a supprimer', price: 10 }
    When method post
    Then status 201
    
    # 2. On récupère son ID généré dynamiquement
    * def idToDelete = response.id
    * print '>>> ID à supprimer :', idToDelete

    # 3. On supprime ce produit spécifique
    Given path 'products', idToDelete
    When method delete
    Then status 200
    
    # 4. (Optionnel) On vérifie qu'il n'existe plus
    Given path 'products', idToDelete
    When method get
    Then status 404

    # Ajoutez ceci à la fin de votre fichier
  Scenario: 04 - Récupérer un produit spécifique (ID 1)
    Given path 'products', 1
    When method get
    Then status 200
    * print '>>> Produit récupéré :', response.title