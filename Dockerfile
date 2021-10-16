# Set Docker Base Image
FROM williambutcherbot/python:latest

RUN apt-get -qq install -y p7zip-full p7zip-rar mediainfo unzip screenfetch -y

# Installing Requirements
RUN pip3 install -U pip
COPY requirements.txt .
RUN pip3 install --no-cache-dir -U -r requirements.txt

WORKDIR /wbb
RUN chmod 777 /wbb
