FROM node:18-alpine
WORKDIR /app

# Salin package.json DAN package-lock.json
COPY package*.json ./

# Gunakan install standar atau ci dengan omit dev
RUN npm install --omit=dev

COPY . .
USER node
EXPOSE 3000
CMD ["node", "app.js"]
