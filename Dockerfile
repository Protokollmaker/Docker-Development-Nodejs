FROM node:current-alpine3.15
WORKDIR /app
COPY package.json ./package.json

ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
        then npm install; \
        else npm install --only=production; \
        fi
COPY ./src/ ./src/
COPY ./security/ ./security/

ENV PORT 4000
EXPOSE $PORT

CMD ["npm", "start"]