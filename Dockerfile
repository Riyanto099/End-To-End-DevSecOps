FROM node:18-alpine

WORKDIR /app

COPY package.json package-lock.json* ./

RUN npm install --omit=dev

COPY . .

USER node

EXPOSE 3000

CMD ["node", "app.js"]
