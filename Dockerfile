# Start with a base image
FROM busybox

# Install necessary packages
RUN apt-get update && apt-get install -y make gcc perl linux-headers-$(uname -r) && apt-get clean

# Add your application files
COPY . /app

# Set the working directory
WORKDIR /app

# Define the command to run your application
CMD ["sh", "start.sh"]
