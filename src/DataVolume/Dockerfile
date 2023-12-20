FROM node:14

WORKDIR /app

COPY package.json .

RUN npm install

COPY . /app

# Using argument variable, build time default to port 80 unless specified
ARG DEFAULT_PORT=80

# Using environment variable, runtime default to port 80 - this will be dynamic passed from Arg
ENV PORT ${DEFAULT_PORT}

EXPOSE ${PORT}

# This creats an anonymous volume managed by Docker, will not be persisted if container is shutdown
# VOLUME [ "/app/feedback" ] 

CMD ["npm", "start"]