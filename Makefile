build:
	docker build --force-rm --pull -t gotary-dev .
enter:
	docker run -it -e TERM=bash -v $$GOPATH/src/github.com/monetas:/opt/go/src/github.com/monetas -v $$HOME:/home/dev gotary-dev
