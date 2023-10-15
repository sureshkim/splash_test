# Use the official Python base image
FROM python:3.8-slim-buster

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    libxml2 \
    libxml2-dev \
    libxslt1-dev \
    libffi-dev \
    libssl-dev \
    libcairo2 \
    libpango-1.0-0 \
    libgdk-pixbuf2.0-0 \
    libffi-dev \
    shared-mime-info

# Install Scrapy Splash dependencies
RUN pip install scrapy scrapy-splash

# Install Splash
RUN curl -sSL https://get.docker.com/ | sh
RUN docker pull scrapinghub/splash

# Expose the Splash port
EXPOSE 8050

# Start the Splash server
CMD docker run -p 8050:8050 scrapinghub/splash
