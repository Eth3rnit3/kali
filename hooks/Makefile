build:
	docker build . -t ruby3-slim

shell:
	docker run -it ruby3-slim /bin/bash

exec:
	docker run -v /Users/eth3rnit3/kali/hooks:/scripts ruby3-slim ruby /scripts/script.rb

start: build shell