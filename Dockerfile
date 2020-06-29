FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build
# '/app/build' <--- what will then need



FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

# DEFAULT COMMAND WILL START AND SERVE EVERYTHING THAT LIVES IN THE FOLDER ABOUVE ( /usr/share/nginx/html )




