# Set Docker Base Image
FROM williambutcherbot/python:latest

WORKDIR /wbb

COPY requirements.txt .

# Installing Mediainfo Latest
RUN wget -O ./libzen0v5_0.4.39-1_amd64.xUbuntu_20.04.deb https://mediaarea.net/download/binary/libzen0/0.4.39/libzen0v5_0.4.39-1_amd64.xUbuntu_20.04.deb \
    && apt install -y ./libzen0v5_0.4.39-1_amd64.xUbuntu_20.04.deb && rm ./libzen0v5_0.4.39-1_amd64.xUbuntu_20.04.deb \
    && wget -O ./libmediainfo0v5_21.09-1_amd64.xUbuntu_20.04.deb https://mediaarea.net/download/binary/libmediainfo0/21.09/libmediainfo0v5_21.09-1_amd64.xUbuntu_20.04.deb \
    && apt install -y ./libmediainfo0v5_21.09-1_amd64.xUbuntu_20.04.deb && rm ./libmediainfo0v5_21.09-1_amd64.xUbuntu_20.04.deb \
    && wget -O ./mediainfo_21.09-1_amd64.xUbuntu_20.04.deb https://mediaarea.net/download/binary/mediainfo/21.09/mediainfo_21.09-1_amd64.xUbuntu_20.04.deb \
    && apt install -y ./mediainfo_21.09-1_amd64.xUbuntu_20.04.deb && rm ./mediainfo_21.09-1_amd64.xUbuntu_20.04.deb

# Installing Requirements
RUN apt-get -qq update && apt install -y software-properties-common \
    && apt-add-repository non-free && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
    p7zip-full p7zip-rar unzip screenfetch xz-utils zstd \
    tesseract-ocr libtesseract-dev wkhtmltopdf nodejs inetutils-ping \
    && wget -O ./mongodb-database-tools-ubuntu2004-x86_64-100.5.1.deb https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu2004-x86_64-100.5.1.deb \
    && apt install ./mongodb-database-tools-ubuntu2004-x86_64-100.5.1.deb && rm ./mongodb-database-tools-ubuntu2004-x86_64-100.5.1.deb \
    && pip3 install -U pip && pip3 install --no-cache-dir -U -r requirements.txt \
    && chmod 777 /wbb
