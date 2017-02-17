FROM node:boron

USER root

ENV CONTAINER_PATH=/usr/src/
ENV CONTAINER_PATH_APP=/usr/src/app/
ENV CONTAINER_MONGODB_PORT=27017
ENV CONTAINER_SERVERHTTP_PORT=8080
ENV CONTAINER_PATH_DB=/data/db/

# Create app directory
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get clean
RUN mkdir -p ${CONTAINER_PATH_APP}
RUN mkdir -p ${CONTAINER_PATH_DB}
RUN chown root:root -R ${CONTAINER_PATH_DB}
RUN chown root:root -R ${CONTAINER_PATH_APP}
RUN chmod -R 777 ${CONTAINER_PATH}
RUN chmod -R 777 ${CONTAINER_PATH_DB}

RUN apt-get install -y mongodb

#RUN rm /var/lib/mongodb/mongod.lock
RUN mongod --repair

WORKDIR ${CONTAINER_PATH_APP}

# Install app dependencies
COPY package.json ${CONTAINER_PATH_APP}

# Bundle app source
COPY . ${CONTAINER_PATH_APP}

VOLUME [${CONTAINER_PATH_APP}]

EXPOSE ${CONTAINER_SERVERHTTP_PORT}
EXPOSE 3000
EXPOSE 3001
EXPOSE ${CONTAINER_MONGODB_PORT}

CMD ["service mongodb start"]
CMD ["sh", "-c", "npm install --no-bin-links && npm start ; /bin/bash"]

# docker build -t expressjs-mongodb .
# docker run -it --name node -p 49160:8080 -p 27017:27017 -d -v ~/workspace/project-x/node:/usr/src/app/ expressjs-mongodb
