# ---- build stage (Debian for familiar toolchain) ----
FROM node:20-bookworm-slim AS build
ENV NODE_ENV=production
WORKDIR /app

# reproducible, prod-only install
COPY package*.json ./
RUN npm ci --omit=dev

# bring in the app source
COPY . .

# If you have a build step (TS/webpack/etc.), uncomment:
# RUN npm run build

# ---- runtime stage (Alpine to avoid Debian PAM/zlib) ----
FROM node:20-alpine AS runtime
ENV NODE_ENV=production
WORKDIR /app

# copy exactly what we built (includes node_modules from build)
COPY --from=build /app /app

# create unprivileged user (Alpine)
RUN addgroup -S nodejs && adduser -S node -G nodejs
USER node

EXPOSE 8080
CMD ["npm", "start"]
