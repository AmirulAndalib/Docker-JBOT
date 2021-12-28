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
    && pip3 install -U pip && pip3 install --no-cache-dir -U -r requirements.txt \
    && chmod 777 /wbb
