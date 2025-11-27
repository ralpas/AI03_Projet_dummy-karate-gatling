FROM node:18-alpine
WORKDIR /app

# On installe uniquement json-server (version stable 0.17.4)
RUN npm init -y && \
    npm install json-server@0.17.4

# On copie les données
COPY db.json ./

EXPOSE 3000

# Démarrage SIMPLE (sans le middleware d'auth "-m")
# On lance directement json-server sur le fichier db.json
CMD ["./node_modules/.bin/json-server", "db.json", "--port", "3000", "--host", "0.0.0.0"]