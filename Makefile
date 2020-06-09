run: build
	sudo ./main

build:
	go build main.go

clean:
	rm -f main