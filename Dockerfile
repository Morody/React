FROM node:latest as build
WORKDIR /app
ADD package*.json ./
RUN npm ci
ADD . .
RUN npm run build --prod

FROM node:18
COPY --from=build /app/build .
RUN npm install -g serve
CMD ["serve", "-g", "build"]
