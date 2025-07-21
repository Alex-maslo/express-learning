# 1. Вибираємо офіційний Node.js 22 образ (Alpine)
FROM node:22-alpine

# 2. Робоча директорія в контейнері
WORKDIR /app

# 3. Копіюємо package.json і package-lock.json
COPY package*.json ./
COPY tsconfig.json ./

# 4. Встановлюємо продакшн-залежності
RUN npm install

# 5. Копіюємо весь проект
COPY . .

# 6. Збираємо TypeScript
RUN npm run build

# 7. Відкриваємо порт 3000
EXPOSE 3000

# 8. Запускаємо додаток
CMD ["node", "dist/main.js"]