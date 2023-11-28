
FROM node:lts-buster-slim
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /usr/src/app

COPY package.json .
COPY yarn.lock .

# Check if Yarn is already installed, and if not, install it
RUN command -v yarn >/dev/null 2>&1 || { npm install -g yarn; }

RUN yarn install

COPY . .

CMD ["yarn", "start"]
