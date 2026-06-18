FROM python:3

# This fork vendors a patched safaribooks.py (see ./safaribooks.py) updated for
# O'Reilly's current v2 API, instead of cloning the now-broken upstream at build time.
WORKDIR /safaribooks

COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

COPY safaribooks.py safaribooks.py
COPY sso sso
COPY login login
RUN chmod a+rx sso login && mv sso /usr/bin/ && mv login /usr/bin/
