FROM python:alpine

RUN apk update && apk upgrade && \
    apk add --no-cache git

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN git clone https://github.com/yuenwong2sps/data602-test-trader /usr/src/app/data602-test-trader
EXPOSE 5000
CMD [ "python", "/usr/src/app/data602-test-trader/trader.py" ]
