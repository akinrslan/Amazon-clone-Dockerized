FROM node:lts-buster-slim
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /usr/src/app

COPY package.json .
COPY yarn.lock .

RUN npm install -g yarn
RUN yarn install

COPY . .

CMD ["yarn", "start"]
