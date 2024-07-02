FROM node:18.18.0 AS builder
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install
COPY . .
RUN yarn build

# CREATE FINAL NGINX IMAGE

FROM nginx:latest
EXPOSE $NGINX_PORT
COPY --from=builder /app/build /usr/share/nginx/html
RUN mkdir /config &&\
  rm /etc/nginx/conf.d/default.conf &&\
  ln -s /config/custom.conf /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]

