FROM ubuntu:18.04

ENV TIMEZONE Asia/Yerevan
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /usr/src/app

RUN apt update && apt upgrade -y && apt install -y \
    python3 \
    python3-pip \
    python3-dev \
    libmysqlclient-dev tzdata libssl-dev && \
    ln -fs /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    pip3 install --upgrade pip

COPY requirements.txt ./

RUN pip3 install -r requirements.txt

COPY . ./

CMD ["python3", "run.py"]