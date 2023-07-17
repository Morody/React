FROM node:latest as build
WORKDIR /app
ADD package*.json ./
RUN npm ci
ADD . .
RUN npm run build --prod

FROM node:18
COPY --from=build /app/build .
RUN npm install -g serve
RUN serve -s build
RUN docker stop $(docker ps -aq) && docker rm $(docker ps -aq)
