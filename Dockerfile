FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

# DEFAULT COMMAND WILL START AND SERVE EVERYTHING THAT LIVES IN THE FOLDER ABOUVE ( /usr/share/nginx/html )




