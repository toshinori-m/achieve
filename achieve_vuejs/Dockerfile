FROM node:16.17.1-alpine

RUN apk update && apk add --no-cache git curl && curl -o- -L https://yarnpkg.com/install.sh | sh

RUN mkdir -p /achieve_vue
WORKDIR /achieve_vue

COPY package*.json ./
RUN yarn install
COPY . .

CMD ["yarn", "run", "serve"]