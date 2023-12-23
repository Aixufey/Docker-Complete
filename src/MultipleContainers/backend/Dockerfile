FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . /app

EXPOSE 80

ENV MONGODB_USERNAME=root

ENV MONGODB_PASSWORD=123123

CMD ["npm", "start"]