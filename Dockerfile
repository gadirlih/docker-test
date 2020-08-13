FROM node:alpine AS builder

WORKDIR /app

COPY . .

RUN npm install && npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

