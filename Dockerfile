FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# copy something from a previous named build - here /app/build is being from the previous build to the nginx folder in the current build
COPY --from=builder /app/build /usr/share/nginx/html
