FROM resin/rpi-raspbian:jessie-20170111
RUN apt-get update
RUN apt-get install -qy wget git gcc

# ----------------
# |  INSTALL GO  |
# ----------------
RUN wget https://storage.googleapis.com/golang/go1.8.linux-armv6l.tar.gz
RUN tar -C /usr/local -xzf go1.8.linux-armv6l.tar.gz
RUN mkdir /root/googleDrive
RUN chmod 755 /root/googleDrive/*
ENV GOPATH=/root/googleDrive
ENV PATH=/$GOPATH:/usr/local/go/bin:/$PATH

# -------------------
# |  INSTALL DRIVE  |
# -------------------
RUN CGO_ENABLED=0 go get -u github.com/odeke-em/drive/cmd/drive
RUN wget -P /root/googleDrive https://raw.githubusercontent.com/mechadwick/Pi-Utilities/master/drive/Sync-All-The-Things.sh
RUN wget -P /root/googleDrive https://raw.githubusercontent.com/mechadwick/Pi-Utilities/master/drive/Sync-All-The-Things-Verbose.sh

# -----------------------
# |  PREPARE USB DRIVE  |
# -----------------------
RUN mkdir /media/usb
ENV PATH="/root/googleDrive:/root/googleDrive/bin:${PATH}"
WORKDIR /media/usb

# ---------------------
# |  RUN SYNC SCRIPT  |
# ---------------------
ENTRYPOINT /root/googleDrive/Sync-All-The-Things.sh
