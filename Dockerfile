# Every instructions are layer, each layer will be cached that helps with Image building



# Building on top of existing Image Node:14
FROM node:14

# All susbsequent cmd will be executed in this directory
WORKDIR /app

# Copy package.json first to take advantage of caching when we build the image to prevent re-installing all dependencies
COPY package.json /app

# Install all dependencies
RUN npm install

# Copy all files from current directory to /app directory in the container
COPY . /app

# Expose port 80 to local machine when this container is running
EXPOSE 80

# Execute the command when a container is run, running the container
CMD ["node", "server.js"]

# Build the image, make sure Docker Desktop is running
# docker build .

# It will return an image id then run this on desired port, i.e. 3000, on docker exposed port 80
# docker run -p 3000:80 image_Id 