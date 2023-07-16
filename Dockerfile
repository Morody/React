FROM node:latets as build
WORKDIR /app
ADD package*.json ./
RUN npm ci
ADD . .
RUN npm run build --prod

FROM node:18
COPY --from=build /app/build .