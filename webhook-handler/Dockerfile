FROM tiangolo/uwsgi-nginx-flask:python3.8

RUN apt-get update -y && apt-get install apt-transport-https ca-certificates -y

RUN pip -qq install six GitPython

COPY ./app /app
