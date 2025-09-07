# Backend Dockerfile (quick, installs production deps if no lockfile)
FROM node:18
WORKDIR /app

# copy package metadata
COPY package*.json ./

# install production dependencies (fallback when package-lock.json missing)
RUN npm install --production --no-audit --progress=false

# copy application source
COPY . .

# recommended env var format
ENV NODE_ENV=production
ENV PORT=3000

EXPOSE 3000

# change to your start command if different (e.g., npm start)
CMD ["node", "index.js"]
