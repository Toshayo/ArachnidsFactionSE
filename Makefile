FOLDER:=$(shell cat info.json | grep -E "\"name\"\W*:\W*\".+\"" | cut -d "\"" -f 4)_$(shell cat info.json | grep -E "\"version\"\W*:\W*\".+\"" | cut -d "\"" -f 4)


build-zip:
	mkdir -p build/$(FOLDER)
	rsync -r --exclude=build --exclude=Makefile --exclude=.gitignore . build/$(FOLDER)/
	cd build && zip -r ../$(FOLDER).zip $(FOLDER) && cd -
	rm -r build

clean:
	rm -rf build $(shell cat info.json | grep -E "\"name\"\W*:\W*\".+\"" | cut -d "\"" -f 4)_*.zip
