FROM node:14-alpine
WORKDIR /app

COPY package.json package-lock.json
RUN npm install && npm cache clean --force
COPY . . 
RUN npm run build

USER node
EXPOSE 4000
ENTRYPOINT ["node", "dist/main.js"]