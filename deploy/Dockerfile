FROM node:12

RUN npm install --g now@11.0.6

COPY ../package.json ../package-lock.json ../Dockerfile /

WORKDIR /

ENTRYPOINT ["/deploy.sh"]
