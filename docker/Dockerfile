FROM node:22.6.0-alpine3.20 as build

WORKDIR /opt/sample

COPY package*.json .

RUN apk update && \
    apk upgrade \
    && npm install \
    && chown -R node:node /opt/sample

USER 1000
COPY src .

FROM node:22.6.0-alpine3.20
WORKDIR /opt/sample

# Copy only the built application from the previous stage
COPY --from=build /opt/sample /opt/sample

USER 1000

ENTRYPOINT ["node"]
CMD ["app.js"]