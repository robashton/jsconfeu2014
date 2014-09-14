INPUTS := $(wildcard in/*.txt)
OUTPUTS := $(patsubst in/%,out/%, $(INPUTS))

all: $(OUTPUTS)
	@echo > /dev/null

out/%.txt: in/%.txt out
	cp $< $@

out:
	mkdir -p out

