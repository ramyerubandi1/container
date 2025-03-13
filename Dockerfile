FROM amazonlinux:latest

# Install AWS CLI and other dependencies
RUN yum install -y unzip curl && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws

# Copy install and entrypoint scripts
COPY install.sh /install.sh
COPY entrypoint.sh /entrypoint.sh

# Make scripts executable
RUN chmod +x /install.sh /entrypoint.sh

# Set the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
