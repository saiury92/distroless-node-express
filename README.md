### Full official image

```dockerfile
FROM node:18
ADD . /app
WORKDIR /app
RUN npm install --omit=dev
EXPOSE 3000
CMD ["index.js"]
```

Build normal-app image:

```
docker build -f Dockerfile -t normal-app .
```

### Slim image

```dockerfile
FROM node:18 AS build-env
ADD . /app
WORKDIR /app
RUN npm install --omit=dev

FROM node:18-buster-slim
COPY --from=build-env /app /app
WORKDIR /app
EXPOSE 3000
CMD ["index.js"]
```

Build slim-app image:

```
docker build -f Dockerfile.buster-slim -t slim-app .
```

### Alpine image

```dockerfile
FROM node:18 AS build-env
ADD . /app
WORKDIR /app
RUN npm install --omit=dev

FROM node:18-alpine
COPY --from=build-env /app /app
WORKDIR /app
EXPOSE 3000
CMD ["index.js"]
```

Build alpine-app image:

```
docker build -f Dockerfile.alpine -t alpine-app .
```

### Distroless image

```dockerfile
FROM node:18 AS build-env
ADD . /app
WORKDIR /app
RUN npm install --omit=dev

FROM gcr.io/distroless/nodejs:18
COPY --from=build-env /app /app
WORKDIR /app
EXPOSE 3000
CMD ["index.js"]
```
```
docker build -f Dockerfile.distroless -t distroless-app .
```
