FROM tiangolo/uwsgi-nginx-flask:python3.8

RUN apt-get update -y && apt-get install apt-transport-https ca-certificates -y

RUN pip -qq install six GitPython waitress

#Clone the folder recettes
ADD cloneFolder.sh .
RUN chmod +x cloneFolder.sh
RUN ./cloneFolder.sh

#Copy the application
COPY ./app /app
WORKDIR /
