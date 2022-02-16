# Set Docker Base Image
FROM williambutcherbot/python:latest

WORKDIR /wbb

COPY requirements.txt .

# Installing Requirements
RUN apt-get -qq update && apt install -y software-properties-common \
    && apt-add-repository non-free && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
    p7zip-full p7zip-rar mediainfo unzip screenfetch xz-utils zstd \
    tesseract-ocr libtesseract-dev wkhtmltopdf nodejs \
    && wget -O ./mediainfo_21.09-1_amd64.xUbuntu_20.04.deb https://mediaarea.net/download/binary/mediainfo/21.09/mediainfo_21.09-1_amd64.xUbuntu_20.04.deb \
    && apt install ./mediainfo_21.09-1_amd64.xUbuntu_20.04.deb && rm ./mediainfo_21.09-1_amd64.xUbuntu_20.04.deb \
    && wget -O ./mongodb-database-tools-ubuntu2004-x86_64-100.5.1.deb https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu2004-x86_64-100.5.1.deb \
    && apt install ./mongodb-database-tools-ubuntu2004-x86_64-100.5.1.deb && rm ./mongodb-database-tools-ubuntu2004-x86_64-100.5.1.deb \
    && pip3 install -U pip && pip3 install --no-cache-dir -U -r requirements.txt \
    && chmod 777 /wbb
