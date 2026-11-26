
FROM node:20-bookworm

RUN apt-get update && apt-get install -y unzip python3 make g++ && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY darkcall.zip /tmp/darkcall.zip

RUN unzip -q /tmp/darkcall.zip -d /tmp/extracted \
    && cp -a /tmp/extracted/darkcall/. /app/ \
    && rm -rf /tmp/extracted /tmp/darkcall.zip

RUN npm install --omit=dev

ENV NODE_ENV=production
ENV DATA_DIR=/data

EXPOSE 3000

CMD ["npm", "start"]
