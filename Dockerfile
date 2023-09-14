FROM node:latest as build
WORKDIR /app
ADD package*.json ./
RUN npm ci
ADD . .
RUN npm run build --prod

FROM node:latest as runner
WORKDIR /app
COPY --from=build /app/build .
COPY package*.json ./
RUN npm install 
COPY . /app
CMD [ "npm", "start" ]
