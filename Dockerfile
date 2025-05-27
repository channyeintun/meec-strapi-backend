FROM node:20-slim

# Set working directory
WORKDIR /app

# Copy only package.json (exclude package-lock.json)
COPY package.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Strapi admin panel (for production)
RUN npm run build

# Expose the Strapi port
EXPOSE 1337

# Start the Strapi application
CMD ["npm", "run", "start"]