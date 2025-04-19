FROM ubuntu:24.04
LABEL authors="ubuntu"

SHELL ["/bin/bash", "-c"]
WORKDIR /root

RUN apt-get update && apt-get install -y git pipx make sudo

RUN git clone https://github.com/qmk/qmk_firmware.git --depth 1 --recurse-submodules --shallow-submodules -b 0.22.14 ~/qmk_firmware

RUN pipx install qmk
ENV PATH="/root/.local/bin:$PATH"
RUN qmk setup --yes
RUN /root/.local/share/pipx/venvs/qmk/bin/python -m pip install -r /root/qmk_firmware/requirements.txt

WORKDIR /root/qmk_firmware