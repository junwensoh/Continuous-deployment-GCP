FROM node:latest

# creates a working dir /usr/src/app
WORKDIR /usr/src/app

# copys package.json and package-lock.json into the working dir /usr/src/app
COPY package*.json ./

# install the packages, thus node_modules inside working dir /usr/src/app
# that is why we do not import the node_modules into the working dir /usr/src/app 
# by placing node_modules into the .dockerignore file
RUN npm install

# copy all files from current directory into the working directory
COPY . .

# expose port 8080 of the container
EXPOSE 8080

# run node app.js command when inside the container
CMD ["node", "app.js"]