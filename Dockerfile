FROM python:3.7-alpine

RUN  pip install rungutan

COPY entrypoint.sh ./

RUN  chmod +x entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]