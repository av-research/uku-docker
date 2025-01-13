FROM osrf/ros:noetic-desktop

RUN apt update && apt install -y \
    libzmq3-dev \
    libgoogle-glog-dev \
    libqglviewer-dev-qt5 \
    libserial-dev \
    libfuse2 \
    python3-pip \
    qtcreator \
    qtbase5-dev \
    qt5-qmake \
    cmake

# Some programs for convenience, not necessary
RUN apt install -y \
	tmux \
	vim \
	iproute2 \
	can-utils

COPY . /code
WORKDIR /code

COPY requirements.txt /code
COPY zadar_entry.sh /usr/local/bin/

RUN pip3 install --no-cache-dir -r requirements.txt

ENTRYPOINT ["zadar_entry.sh"]
