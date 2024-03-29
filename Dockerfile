FROM python:3.10-slim-buster
RUN apt-get update -y
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*
RUN python3 -m pip install --upgrade pip && \
    pip3 install -U pip
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs
RUN npm install -g npm
WORKDIR /aditya/
COPY . /aditya/
RUN pip3 install -U -r requirements.txt
CMD python3 -m AdityaHalder
