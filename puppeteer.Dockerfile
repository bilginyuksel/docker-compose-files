FROM node:12-alpine3.14

# Installs latest Chromium (92) package.
RUN apk add --no-cache \
      chromium \
      nss \
      freetype \
      harfbuzz \
      ca-certificates \
      ttf-freefont \
      nodejs \
      yarn

# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

WORKDIR /app

COPY . /app

# Puppeteer v10.0.0 works with Chromium 92.
# RUN yarn add express && yarn add puppeteer@10.0.0 && yarn add multer
RUN yarn install --frozen-lockfile --production --non-interactive

# replace with your application startup script
CMD ["node", "index.js"]

EXPOSE 3000