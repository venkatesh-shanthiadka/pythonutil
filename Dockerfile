FROM python:3.9.16-buster

RUN apt-get update && \
      apt-get -y install sudo nano

RUN addgroup --gid 1000 python
# RUN useradd --uid 1000 --gid python --shell /bin/bash --create-home python
RUN adduser --disabled-password --gecos '' --uid 1000 --gid 1000 python
RUN usermod -aG sudo python
RUN echo "python ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

# Setting the apt proxy configuration
COPY apt.conf /etc/apt/apt.conf

USER python
WORKDIR /home/python

# Installing the zsh
# RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)"

# ENTRYPOINT [ "/bin/bash" ]
CMD [ "tail", "-f", "/dev/null" ]