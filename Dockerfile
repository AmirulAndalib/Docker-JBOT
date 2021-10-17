# Set Docker Base Image
FROM williambutcherbot/python:latest

RUN apt-get -qq update && apt install -y software-properties-common \
    && apt-add-repository non-free && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
    p7zip-full p7zip-rar mediainfo unzip screenfetch xz-utils

# Installing Requirements
RUN pip3 install -U pip
COPY requirements.txt .
RUN pip3 install --no-cache-dir -U -r requirements.txt

WORKDIR /wbb
RUN chmod 777 /wbb
