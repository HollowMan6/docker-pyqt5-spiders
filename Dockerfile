FROM ubuntu:latest

MAINTAINER Hollow Man <hollowman@hollowman.ml>

ENV DEBIAN_FRONTEND=noninteractive

RUN adduser --quiet --disabled-password hollowman

RUN apt-get update \
    && apt-get install -y \
      python3 \
      python3-pyqt5 \
      python3-pip \
      wget \
      libgl1-mesa-glx \
      libxss1 \
      libappindicator1 \
      libindicator7 \
      libjpeg8-dev \
      libpng-dev \
      libtiff5-dev \
      zlib1g-dev \
      libleptonica-dev \
      libtesseract-dev \
      tesseract-ocr \
      fonts-liberation \
      libappindicator3-1 \
      libasound2 \
      libnspr4 \
      libnss3 \
      xdg-utils \
      libcanberra-gtk-module \
      tcl-dev \
      tk-dev \
      python3-tk \
      dbus \
      locales
      
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8    
ENV LANGUAGE en_US:en    
ENV LC_ALL en_US.UTF-8 

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome*.deb
RUN rm -rf google-chrome*.deb
RUN apt-get install -f && apt-get clean

RUN pip3 install --upgrade pip

RUN pip3 install --no-cache-dir requests pdfminer3k lxml numpy opencv-python opencv-contrib-python pillow selenium pyecharts pytesseract xlwt

CMD [ "sh", "-c", "/etc/init.d/dbus start" ]
