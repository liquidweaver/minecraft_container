FROM phusion/baseimage:0.9.11

# Make sure we don't get notifications we can't answer during building.
ENV  DEBIAN_FRONTEND noninteractive
ENV  FORGE_VERSION 1.6.4-9.11.1.965
ENV  COMPUTERCRAFT_VERSION   1.63

RUN apt-get update && \
    apt-get -y install openjdk-6-jre-headless wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## No ssh
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

RUN mkdir -p /minecraft/mods
WORKDIR /minecraft
RUN wget http://files.minecraftforge.net/maven/net/minecraftforge/forge/${FORGE_VERSION}/forge-${FORGE_VERSION}-installer.jar \
	 -O /minecraft/forge.jar
RUN java -jar forge.jar --installServer
RUN rm /minecraft/forge.jar
RUN wget http://www.curseforge.com/media/files/785/780/ComputerCraft${COMPUTERCRAFT_VERSION}.jar \
	 -O /minecraft/mods/ComputerCraft${COMPUTERCRAFT_VERSION}.jar
RUN echo eula=true > eula.txt

EXPOSE 25565
CMD java -jar minecraftforge*
