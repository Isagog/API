# -----
# -- Setup OpenAPI Generator
# -----

FROM openapitools/openapi-generator-cli as openapi

RUN mkdir -p /app
RUN cp /opt/openapi-generator/modules/openapi-generator-cli/target/openapi-generator-cli.jar /app

VOLUME /app

# -----
# -- Build project
# -----

FROM jfloff/alpine-python
FROM maven:3.6.1-jdk-8-alpine AS maven
MAINTAINER admin@isagog.com

# Extend base image
COPY --from=openapi /app/openapi-generator-cli.jar /opt
COPY --from=maven . . 

# Create 'openapi-generator' command
RUN echo 'java -jar /opt/openapi-generator-cli.jar $@' >> /usr/bin/openapi-generator
RUN chmod +x /usr/bin/openapi-generator

# Install requirements
RUN apk --no-cache add wget

# Copy source project into the image
RUN mkdir -p /app
WORKDIR /app
COPY . .

# Install Isagog API
RUN cd client && ./INSTALL.sh

# Clean source project
WORKDIR /
RUN rm -rf /app
