FROM resin/rpi-raspbian:jessie-20170111
RUN apt-get update && apt-get install -qy wget git gcc python-dev

# ---------------------
# |  INSTALL JUPYTER  |
# ---------------------
RUN pip install --upgrade pip && pip install jupyter