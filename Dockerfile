FROM python:3
RUN apt-get update && apt-get install --no-install-recommends -y git && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/lorenzodifuccia/safaribooks.git /safaribooks
WORKDIR /safaribooks
RUN pip3 install --no-cache-dir -r requirements.txt
COPY sso sso
COPY login login
RUN chmod o+x sso && chmod o+x login && mv sso /usr/bin/ && mv login /usr/bin/
