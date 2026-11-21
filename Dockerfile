FROM node:22-alpine
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --omit=dev --ignore-scripts
COPY index.html ./
COPY src ./src
COPY public ./public
COPY scripts ./scripts
RUN npm run build
ENV PORT=3000
EXPOSE 3000
CMD ["npm", "run", "serve"]
