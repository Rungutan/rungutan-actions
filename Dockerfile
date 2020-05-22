FROM python:3.7-alpine

RUN  pip install rungutan

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN  chmod +x entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]