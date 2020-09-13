# Base Image
FROM node:12

# Maintainer
LABEL maintainer "tsutaka"

# Install Path
ENV APP_PATH /opt/FaceCollector

# Make work directory
WORKDIR /opt/FaceCollector

# Copy package.json and package-lock.json
COPY package*.json ./

# Install package
RUN npm install

# Copy files required for the app to run
COPY src/server.js $APP_PATH/src/
COPY templates/ $APP_PATH/templates/
COPY static/ $APP_PATH/static/

# Port number expose
EXPOSE 80

# Run the application
CMD ["node", "/opt/FaceCollector/src/server.js"]
