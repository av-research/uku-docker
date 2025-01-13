FROM ubuntu:focal

# Necessary environment variables, these enable the Dockerfile to be used in a non-interactive manner
ENV ROS_DIST noetic
ENV TZ=Europe/Helsinki
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Initial setup, update/upgrade and install basic tools
RUN \
    apt update && apt upgrade -y \
    && apt install -y software-properties-common \
    && apt update \
    && apt install -y \
        curl \
        vim \
        tldr \
        tmux \
        xclip \
        wget \
        cmake \
        python3-pip \
    && apt autoremove -y

# pip setup & installing mkdocs for documentation
RUN \
    echo "export PATH=\"$HOME/.local/bin:$PATH\"" >> ~/.bashrc

# Locale setup
RUN \
	apt-get update && apt-get install locales \
	&& locale-gen en_US en_US.UTF-8 \
	&& update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 \
	&& export LANG=en_US.UTF-8

# Install ROS1
RUN \
    add-apt-repository universe \
    && apt update \
    && echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list \
    && curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - \
    && apt update && apt install -y ros-dev-tools \
    && apt update && apt upgrade -y\
    && apt install -y ros-noetic-desktop \
    && echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

# Install ROS utilities and drivers
RUN \
    apt update \
    && apt install -y \
        ros-noetic-xacro \
        ros-noetic-joint-state-publisher-gui \
        ros-noetic-diagnostic-updater \
        python3-rosdep \
        python3-rosinstall \
        python3-rosinstall-generator \
        python3-wstool \
        build-essential

WORKDIR /code

ENTRYPOINT ["/code/entry.sh"]
