all: out/pinkie.txt out/rainbow.txt
	@echo > /dev/null

out/%.txt: in/%.txt out
	cp $< $@

out:
	mkdir -p out

