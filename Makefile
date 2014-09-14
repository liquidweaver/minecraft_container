.PHONY : build run logs debug
build:
	sudo docker build -t liquidweaver/minecraft .
run:
	sudo docker run -d --name="minecraft" -d -p 25565:25565 liquidweaver/minecraft
logs:
	sudo docker logs minecraft
debug:
	sudo docker run --name="minecraft" -it -p 25565:25565 -v /data/minecraft:/data liquidweaver/minecraft /bin/bash
