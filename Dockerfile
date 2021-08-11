# syntax=docker/dockerfile:1
#FROM scratch # Yes! from scratch! It's have nothing even "SHell"-package WTF.
FROM ubuntu:20.04
RUN apt-get update \
    && apt-get -y install apt-transport-https \
    && apt-get -y install ca-certificates \
    && apt-get -y install curl \
    && apt-get -y install gnupg \
    && apt-get -y install lsb-release \
    && apt-get -y install software-properties-common
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN add-apt-repository "$(curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2019.list)"
RUN apt-get update
RUN apt-get install -y mssql-server-is
ENV PATH="/opt/ssis/bin:${PATH}"
# Post installation:
RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
# Attention: Unsure of security issue here, please proceed with caution
#RUN apt-get -y install sudo
#RUN sudo usermod -a -G docker $(whoami)
#RUN sudo gpasswd -a $(whoami) docker
#RUN sudo newgrp docker
RUN ln -s /bin/true /sbin/systemctl 
# ^^ https://stackoverflow.com/questions/66095192/run-in-dockerfile-with-systemd-as-pid-1
RUN systemctl start docker && systemctl enable docker && systemctl restart docker
RUN SSIS_PID=Developer ACCEPT_EULA=Y /opt/ssis/bin/ssis-conf -n setup