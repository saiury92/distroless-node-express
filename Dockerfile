FROM node:18
ADD . /app
WORKDIR /app
RUN npm install --omit=dev
EXPOSE 3000
CMD ["index.js"]