FROM maven:3.9-eclipse-temurin-17
WORKDIR /app
COPY pom.xml .
# Pré-télécharger les dépendances pour le cache (étape longue la 1ère fois)
RUN mvn dependency:go-offline
COPY src ./src
# Commande par défaut (peut être surchargée par docker-compose)
CMD ["mvn", "gatling:test", "-DbaseUrl=http://api:3000"]
