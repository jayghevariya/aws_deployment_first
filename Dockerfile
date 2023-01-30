FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM nginx

# Elastic Beanstalk will automatically expose the port
EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html