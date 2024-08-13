FROM node

RUN apt-get install -y curl
WORKDIR /app

COPY . .

RUN npm install -g npm-check-updates \
    ncu -u \
    npm install \
    npm install express \
    npm install babel-cli \
    npm install babel-preset \
    npm install babel-preset-env

RUN npm ci --only=production

COPY . /app

EXPOSE 30002

CMD [ "babel-node", "app.js" ]
