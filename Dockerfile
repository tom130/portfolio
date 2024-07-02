FROM node:latest AS builder
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --network-timeout 1000000
COPY . .
RUN yarn build

# CREATE FINAL NGINX IMAGE

FROM nginx:latest
EXPOSE $NGINX_PORT
COPY --from=builder /app/build /usr/share/nginx/html
COPY nginx.default.conf.template /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]
