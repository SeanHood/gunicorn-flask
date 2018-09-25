.PHONY: all build run

all:

build:
	docker build . -t gunicorn-flask:latest

run:
	docker run --rm -it -p 5000:5000 gunicorn-flask:latest
