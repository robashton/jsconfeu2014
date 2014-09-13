SOURCEIMAGES := $(wildcard widgets/*/img/*.png)
COPIEDIMAGES := $(addsuffix  _lastcopied, $(SOURCEIMAGES))
COFFEEFILES := $(wildcard widgets/*/*.coffee)
OUTPUTJSFILES := $(patsubst %.coffee,%.js, $(COFFEEFILES))
STYLUSFILES := $(wildcard widgets/*/*.styl)
STYLUSINDEXFILES := $(wildcard widgets/*/index.styl)
OUTPUTCSSFILES := $(patsubst %.styl,%.css, $(STYLUSINDEXFILES))

.DEFAULT_GOAL=all

all: code style images common.mk
	@echo > /dev/null

clean:
	rm -f $(OUTPUTCSSFILES)
	rm -f $(OUTPUTJSFILES)
	rm -f widgets/*/img/*_lastcopied
	rm -rf site/img
	rm -f site/widgets.js
	rm -f site/widgets.css

code: coffee site/widgets.js
	@echo "Compiled code into widgets.js"

style: $(OUTPUTCSSFILES) site/widgets.css
	@echo "Compiled CSS into widgets.css"

coffee: $(OUTPUTJSFILES)
	@echo "Compiled coffeescript into JS"

images: $(COPIEDIMAGES)
	@echo "Copied widget images across into site"

widgets/%_lastcopied: widgets/% | site/img/
	cp widgets/$* site/img/
	@touch $@

site/img/:
	mkdir -p site/img

widgets/%.css: widgets/%.styl $(STYLUSFILES)
	stylus $<

widgets/%.js: widgets/%.coffee
	coffee -c $<

site/widgets.js: $(OUTPUTJSFILES)
	cat $^ > site/widgets.js

site/widgets.css: $(OUTPUTCSSFILES)
	cat $^ > site/widgets.css


