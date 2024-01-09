# Stage 1: Build the Node.js app
FROM node:latest AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .


FROM node:alpine
WORKDIR /app
COPY --from=build /app /app
COPY nginx.conf /etc/nginx/nginx.conf
# COPY nginx.conf /etc/nginx/nginx-ssl.conf

RUN apk --no-cache add nginx
RUN apk --no-cache add curl
EXPOSE 80
CMD ["sh", "start.sh"]
