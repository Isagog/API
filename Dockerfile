FROM jfloff/alpine-python
FROM maven:3.6.1-jdk-8-alpine AS maven
FROM openapitools/openapi-generator-cli AS openapi
MAINTAINER admin@isagog.com

# Extend Alpine image
COPY --from=maven . .
COPY --from=python . .

# Copy source project into the image
RUN mkdir -p /app
WORKDIR /app
COPY . .

# Install requirements
RUN apk --no-cache add wget

# Create 'openapi-generator' command
RUN echo 'java -jar /opt/openapi-generator/modules/openapi-generator-cli/target/openapi-generator-cli.jar $@' >> \
  /usr/bin/openapi-generator && chmod +x /usr/bin/openapi-generator

# Install Isagog API
RUN cd client && ./INSTALL.sh

# Clean source project
WORKDIR /
RUN rm -rf /app
