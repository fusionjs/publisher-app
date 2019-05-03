FROM node:12

COPY ./package.json ./package-lock.json /

WORKDIR /

RUN npm ci

EXPOSE 3000

CMD ["npm", "start"]
