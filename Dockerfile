# Use an existing docker image as a base
# Uses the node image : Adds the alpine version
# Alpine means the most stripped down version possible
FROM node:alpine

# Adds a working directory to nest the copied files so there are no conflicts in the container
WORKDIR /app

# Copies the package.json file first, so if its change only then will npm install run
# Otherwise npm install will everytime a change is made to the app
COPY ./package.json ./

# Download and install a dependencies
RUN npm install

# Copies files from local file system to the container
COPY ./ ./

# Tell the image what to do when it starts
# as a container
CMD ["npm","start"]