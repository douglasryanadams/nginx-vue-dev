FROM node:22.3.0-slim AS build

ENV NODE_ENV development

RUN mkdir -p /tmp/build
WORKDIR /tmp/build
COPY package.json .
RUN npm install

COPY . .
RUN npm run build

FROM nginx

COPY --from=build /tmp/build/dist /usr/share/nginx/html


