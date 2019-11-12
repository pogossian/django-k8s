FROM ubuntu

ENV TIMEZONE Asia/Yerevan
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    libmysqlclient-dev tzdata && \
    ln -fs /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    pip3 install -r requirements.txt && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . ./


EXPOSE 8000

CMD ["python3", "run.py"]