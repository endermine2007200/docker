FROM ubuntu:20.04 as ubuntu-base

RUN apt-get update && \

  apt-get install -y \

  ffmpeg \

  imagemagick \
  
  nodejs \
  
  npm \

  webp && \

  apt-get upgrade -y && \

  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN git clone https://github.com/BochilGaming/games-wabot

RUN cd games-wabot \
    && npm install
    
COPY . .

EXPOSE 5000

CMD ["node", "games-wabot/index.js"]

