# Gunakan base image Node.js yang ringan dan aman
FROM node:18-alpine

# Buat direktori kerja
WORKDIR /app

# Salin package.json dan package-lock.json
COPY package*.json ./

# Install dependensi produksi saja (hindari devDependencies di production)
RUN npm ci --only=production

# Salin source code aplikasi
COPY . .

# [DEVSECOPS BEST PRACTICE] Jalankan aplikasi menggunakan user non-root
USER node

# Expose port aplikasi
EXPOSE 3000

# Perintah untuk menjalankan aplikasi
CMD ["node", "app.js"]
