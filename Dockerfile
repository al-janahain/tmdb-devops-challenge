# build step
FROM node:18-alpine as build
ENV PATH /app/node_modules/.bin:$PATH
WORKDIR /app
COPY package*.json .
COPY package-lock.json .
RUN npm ci --silent
COPY . ./
RUN npm run build


# production environment
FROM nginx:stable-alpine
COPY --from=build /app/build /usr/share/nginx/html
# new nginx.conf
COPY nginx/reactapp.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]