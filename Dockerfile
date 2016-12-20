FROM resin/resin/raspberrypi-python:3.5

#switch on systemd init system in container
ENV INITSYSTEM on


# PiFace
RUN apt-get install python3-pifacedigitalio


# pip install python deps from requirements.txt
# For caching until requirements.txt changes
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

COPY . /usr/src/app
WORKDIR /usr/src/app

CMD ["python3", "/usr/share/doc/python3-pifacedigitalio/examples/blink.py"]