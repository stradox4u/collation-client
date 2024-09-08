# Build
FROM node:20.17 AS build

WORKDIR /client
ENV PATH=./node_modules/.bin/:$PATH

# Install dependencies
COPY package*.json ./
RUN npm ci --quiet

# Copy source code
COPY . .

# Development
FROM build AS dev

EXPOSE 3000
EXPOSE 24678

CMD ["npm", "run", "dev"]

# Testing
FROM build AS test

EXPOSE 3000
EXPOSE 24678

CMD ["npm", "run", "test:ci"]