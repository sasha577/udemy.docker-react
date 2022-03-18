FROM node:alpine as builder
WORKDIR '/app'

CPY package.json .
RUN nmp install

COPY . .

RUN npm run build