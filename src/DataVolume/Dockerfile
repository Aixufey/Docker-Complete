FROM node:14

WORKDIR /app

COPY package.json .

RUN npm install

COPY . /app

EXPOSE 80

# This creats an anonymous volume managed by Docker, will not be persisted if container is shutdown
# VOLUME [ "/app/feedback" ] 

CMD ["npm", "start"]