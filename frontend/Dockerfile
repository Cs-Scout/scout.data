FROM node:18

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# For dev server
CMD ["npm", "start"]