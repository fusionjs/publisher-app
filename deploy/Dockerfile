FROM node:12

LABEL "com.github.actions.name"="Deploy to Now"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="black"

RUN yarn global add now@11.0.6

COPY ../package.json ../package-lock.json ../Dockerfile /

WORKDIR /

ENTRYPOINT ["/deploy.sh"]
