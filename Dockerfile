FROM python:3
RUN apt update -y
RUN apt install -y git
RUN git clone https://github.com/lorenzodifuccia/safaribooks.git /safaribooks
WORKDIR /safaribooks
RUN pip3 install -r requirements.txt
COPY sso sso
COPY login login
RUN chmod o+x sso
RUN chmod o+x login
RUN mv sso /usr/bin/
RUN mv login /usr/bin/
