FROM node:12

LABEL "com.github.actions.name"="Deploy to Now"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="purple"

RUN npm install --g now@11.0.6

COPY ../package.json ../package-lock.json ../Dockerfile /

WORKDIR /

ENTRYPOINT ["/deploy.sh"]
