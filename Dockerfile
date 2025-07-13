FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
# Skip frontend build to avoid errors
# RUN npm run build
RUN npm run predeploy
EXPOSE 9000
CMD ["npm", "start"]
