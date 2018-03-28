ifndef VERBOSE
.SILENT:
endif

VERSION="0.0.1"

build:
	docker build -t macgenius/mc-mapcrafter:$(VERSION) -t macgenius/mc-mapcrafter:latest .

run:
	docker container -d run macgenius/mc-mapcrafter
