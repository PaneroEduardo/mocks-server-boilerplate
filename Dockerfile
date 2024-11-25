FROM mocksserver/main

WORKDIR /input

COPY ./package*.json /input/
RUN npm install

COPY ./mocks /input/mocks/
COPY ./mocks.config.js /input/mocks.config.js

EXPOSE 3100
EXPOSE 3110
