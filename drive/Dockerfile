FROM resin/rpi-raspbian:jessie-20170111
RUN apt-get update
RUN apt-get install -qy wget
RUN mkdir /root/googleDrive
RUN wget -P /root/googleDrive https://github.com/mechadwick/Pi-Utilities/raw/master/drive/drive
RUN wget -P /root/googleDrive https://raw.githubusercontent.com/mechadwick/Pi-Utilities/master/drive/Sync-All-The-Things.sh
RUN wget -P /root/googleDrive https://raw.githubusercontent.com/mechadwick/Pi-Utilities/master/drive/Sync-All-The-Things-Verbose.sh
RUN chmod 755 /root/googleDrive/*
RUN mkdir /media/usb
ENV PATH="/root/googleDrive:${PATH}"
WORKDIR /media/usb
ENTRYPOINT /root/googleDrive/Sync-All-The-Things-Verbose.sh
#ENTRYPOINT drive