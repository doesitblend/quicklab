clean:
	echo "This step should remove all related images"
	
	docker image prune -a -f 
	docker rmi base:latest
	docker rmi base:master
	docker rmi base:minion

base:
	echo "Building base systemd image"
	docker image build --force-rm -t base:latest --build-arg saltversion=2018.3.2 .

master:
	echo "Building Salt master image"
	docker image build --force-rm -t base:master --build-arg saltversion=2018.3.2 -f ./Dockerfile.master .

minion:
	echo "Building Salt minion image"
	docker image build --force-rm -t base:master --build-arg masterip=salt -f ./Dockerfile.minion .

raas:
	echo "Building RaaS image"

raasdb:
	echo "Building RaaS DB"

all:
	echo "Building everything..."
	echo "Might even try to stand it all up for you"
	echo "It might even work if you're lucky ;)"

list:
	docker image list
