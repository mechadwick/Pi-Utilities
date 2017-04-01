FROM resin/rpi-raspbian:jessie-20170111

RUN apt-get update
RUN apt-get -y install git cmake libusb-1.0-0-dev
RUN apt-get -y install build-essential
RUN apt-get -y install libtool autoconf automake libfftw3-dev

WORKDIR /root/
RUN git clone git://git.osmocom.org/rtl-sdr.git
RUN mkdir /root/rtl-sdr/build
WORKDIR /root/rtl-sdr/build

RUN cmake ../ -DINSTALL_UDEV_RULES=ON
RUN make
RUN make install

RUN ldconfig

RUN printf '%s\n%s\n%s\n'  'blacklist dvb_usb_rtl28xxu' 'blacklist rtl2830' 'blacklist rtl2832' >> /etc/modprobe.d/rtl283x-blacklist.conf

RUN echo 'blacklist dvb_usb_rtl28xxu' > /etc/modprobe.d/raspi-blacklist.conf

ENTRYPOINT rtl_tcp -a 0.0.0.0

#RUN apt-get update && apt-get -y upgrade

#RUN apt-get install rtl-sdr

#RUN apt-get -y install git-core nano net-tools --no-install-recommends

#RUN apt-get install -y  cmake pkg-config libusb-1.0

#WORKDIR /root/

#RUN git clone git://git.osmocom.org/rtl-sdr.git

#RUN mkdir /root/rtl-sdr/build
#WORKDIR /root/rtl-sdr/build

#RUN cmake ../ -DINSTALL_UDEV_RULES=ON
#RUN make
#RUN sudo make install
#RUN sudo ldconfig

#RUN apt-get build-dep rtl-sdr --no-install-recommends

#RUN apt-get clean

#RUN echo 'blacklist dvb_usb_rtl28xxu' > /etc/modprobe.d/raspi-blacklist.conf