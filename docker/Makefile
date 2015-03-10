init: loop-pizzabagel
	@echo ♫ ♫ unreasonably hard ♫ ♫

build-base:
	docker build -t="pizza/base" ./base/

build-icecast:
	docker build -t="pizza/icecast" ./icecast/

build-pizzabagel: 
	docker build -t="pizza/bagel" ./pizzabagel/

build: build-base build-icecast build-pizzabagel

start-pizzabagel:
	docker run \
		--name pizza-bagel \
		-p 61224:22 \
		-p 61554:80 \
		-d pizza/bagel

stop-pizzabagel:
	- docker stop pizza-bagel

clean-pizzabagel: stop-pizzabagel
	- docker rm pizza-bagel

loop-pizzabagel: build-pizzabagel clean-pizzabagel start-pizzabagel

#
# Random docker helpers
#
ls:
	docker ps

untagged-clean:
	docker rmi $$(docker images | grep "^<none>" | awk '{print $$3}')

ssh:
	ssh root:pizza@localhost -p 61224

