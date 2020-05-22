FROM python:3.7-alpine

RUN  apk add --no-cache bash \
	&& python -m pip install --upgrade pip \
	&& pip install rungutan

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN  chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]