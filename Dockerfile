FROM node:alpine AS builder

USER root

RUN mkdir -p '/app' && chown -R node '/app'

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

USER root
RUN mkdir -p '/app' && chown -R node '/app'

RUN npm run build

RUN chmod 777 '/app/build'

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
