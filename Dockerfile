# Use the official BusyBox image as the base image
FROM busybox:latest

# Set the working directory
WORKDIR /app

# Copy application files to the container
COPY . .

# Define the default command to run when starting the container
CMD ["bash"]
