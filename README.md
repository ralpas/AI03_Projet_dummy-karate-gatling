# Projet Tests Automatisés (Karate & Gatling)

Ce projet contient l'environnement de tests fonctionnels (Karate) et de performance (Gatling), dockerisé et compatible Windows/Mac.

## Installation (Important sur Windows)

Si vous venez de cloner ce projet (créé sous Mac) sur Windows, vous devez corriger les fins de ligne pour que Docker fonctionne :

1.  **Réparer les fins de ligne (LF) :**
    ```powershell
    git add --renormalize .
    ```

2.  **Construire et démarrer l'environnement :**
    ```powershell
    docker-compose up -d --build
    ```

---

## Commandes de lancement (Windows / PowerShell)

Ces commandes incluent l'opérateur `--%` pour éviter les erreurs de syntaxe PowerShell avec Maven.

### 1. Lancer les tests KARATE (Fonctionnels)

    docker exec -it karate-tests --% mvn test -Dtest=mock.TestRunner -Dkarate.options="classpath:mock/products-read.feature" -DbaseUrl=http://api:3000

### 2. Lancer les tests Gatling 

    docker exec -it karate-tests --% mvn gatling:test -Dgatling.simulationClass=mock.PerformanceSimulation -DbaseUrl=http://api:3000
