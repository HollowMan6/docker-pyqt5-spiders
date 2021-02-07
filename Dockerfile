FROM ubuntu:latest

MAINTAINER Hollow Man <hollowman@hollowman.ml>

LABEL version="1.0.3"
LABEL repository="https://github.com/HollowMan6/docker-pyqt5-spiders"
LABEL homepage="https://hollowman.ml/"
LABEL maintainer="Hollow Man <hollowman@hollowman.ml>"

ENV DEBIAN_FRONTEND=noninteractive

RUN adduser --quiet --disabled-password hollowman
ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN:zh

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
      locales \
      ttf-wqy-microhei \
    && locale-gen zh_CN.UTF-8 \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome*.deb \
    && rm -rf google-chrome*.deb \
    && apt-get install -f \
    && apt-get --purge remove -y \
      locales \
    && apt-get autoremove -y \
    && apt-get clean
    
RUN apt-get install -y \
      unzip \
    && CHROME_VERSION=$(google-chrome --version | cut -f 3 -d ' ' | cut -d '.' -f 1) \
    && CHROMEDRIVER_RELEASE=$(wget -q -O - http://chromedriver.storage.googleapis.com/LATEST_RELEASE_${CHROME_VERSION}) \
    && wget -O /tmp/chromedriver_linux64.zip "http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_RELEASE/chromedriver_linux64.zip" \
    && cd /tmp \
    && unzip chromedriver_linux64.zip \
    && rm -rf chromedriver_linux64.zip \
    && mv chromedriver /usr/local/bin/chromedriver \
    && chmod +x /usr/local/bin/chromedriver \
    && chromedriver --version \
    && apt-get --purge remove -y \
      unzip \
    && apt-get autoremove -y \
    && apt-get clean

RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir requests pdfminer3k lxml numpy opencv-python opencv-contrib-python pillow selenium pyecharts pytesseract xlwt
RUN sh -c 'cd /app; exec "${SHELL:-sh}"'

CMD [ "sh", "-c", "/etc/init.d/dbus start" ]
ENTRYPOINT [ "cd", "/app" ]
