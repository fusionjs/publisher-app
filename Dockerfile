FROM node:12

COPY ./package.json ./package-lock.json /

WORKDIR /

RUN npm ci

CMD ["npm", "start"]
