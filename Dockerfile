FROM ubuntu

RUN apt-get update &&\
	apt-get install -y \
	bats \
	curl \
	figlet \
	git-core \
	make \
	mc \
	wget \
	vim
