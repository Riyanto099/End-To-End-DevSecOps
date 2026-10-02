# Gunakan base image Node.js yang ringan dan aman
FROM node:18-alpine

# Buat direktori kerja
WORKDIR /app

# Salin package.json dan package-lock.json (jika ada)
COPY package.json package-lock.json* ./

# Install dependensi produksi saja dengan aman
RUN npm install --omit=dev

# Salin source code aplikasi
COPY . .

# [DEVSECOPS BEST PRACTICE] Jalankan aplikasi menggunakan user non-root
USER node

# Expose port aplikasi
EXPOSE 3000

# Perintah untuk menjalankan aplikasi
CMD ["node", "app.js"]
