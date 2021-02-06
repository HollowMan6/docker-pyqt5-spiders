FROM ubuntu:latest

MAINTAINER Hollow Man <hollowman@hollowman.ml>

LABEL version="1.0.2"
LABEL repository="https://github.com/HollowMan6/docker-pyqt5-spiders"
LABEL homepage="https://hollowman.ml/"
LABEL maintainer="Hollow Man <hollowman@hollowman.ml>"

ENV DEBIAN_FRONTEND=noninteractive

RUN adduser --quiet --disabled-password hollowman

RUN apt-get update \
    && apt-get install -y \
      python3 \
      python3-pyqt5 \
      python3-pip \
      curl \
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
      locales \
      language-pack-zh-hans \
      ttf-wqy-microhei \
    && locale-gen zh_CN.UTF-8 \
    && curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome*.deb \
    && rm -rf google-chrome*.deb \
    && apt-get install -f && apt-get clean
    
ENV LANG C.UTF-8    
ENV LANGUAGE C.UTF-8    
ENV LC_ALL C.UTF-8 
    
RUN CHROME_VERSION=$(google-chrome --version | cut -f 3 -d ' ' | cut -d '.' -f 1) \
    && CHROMEDRIVER_RELEASE=$(curl --location --fail --retry 3 http://chromedriver.storage.googleapis.com/LATEST_RELEASE_${CHROME_VERSION}) \
    && curl --silent --show-error --location --fail --retry 3 --output /tmp/chromedriver_linux64.zip "http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_RELEASE/    chromedriver_linux64.zip" \
    && cd /tmp \
    && unzip chromedriver_linux64.zip \
    && rm -rf chromedriver_linux64.zip \
    && sudo mv chromedriver /usr/local/bin/chromedriver \
    && sudo chmod +x /usr/local/bin/chromedriver \
    && chromedriver --version

RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir requests pdfminer3k lxml numpy opencv-python opencv-contrib-python pillow selenium pyecharts pytesseract xlwt

CMD [ "sh", "-c", "/etc/init.d/dbus start" ]
