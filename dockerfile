# Use a Node.js base image with a specific version
FROM node:20-slim


RUN apt update && apt upgrade -y

RUN apt install openssl -y

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./


# Install dependencies
RUN npm install

# Copy the entire backend directory to the working directory
COPY . .

# Build your Prisma schema and generate Prisma client
RUN npx prisma generate


# Expose the port that your server will run on (adjust as needed)
EXPOSE 8000

# Command to start your server, adjust as per your setup
CMD ["npm", "run", "dev"]
