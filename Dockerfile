# build step
FROM node:18-alpine as build
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . ./
RUN npm run build

# release step
FROM nginx:latest-alpine as release
COPY --from=build /app/build /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]