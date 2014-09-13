WIDGET_DIR ?= widgets

SOURCEIMAGES := $(wildcard $(WIDGET_DIR)/*/img/*.png)
COPIEDIMAGES := $(addsuffix  _lastcopied, $(SOURCEIMAGES))
COFFEEFILES := $(wildcard $(WIDGET_DIR)/*/*.coffee)
OUTPUTJSFILES := $(patsubst %.coffee,%.js, $(COFFEEFILES))
STYLUSFILES := $(wildcard $(WIDGET_DIR)/*/*.styl)
STYLUSINDEXFILES := $(wildcard $(WIDGET_DIR)/*/index.styl)
OUTPUTCSSFILES := $(patsubst %.styl,%.css, $(STYLUSINDEXFILES))

.DEFAULT_GOAL=all

all: code style images common.mk
	@echo > /dev/null

clean:
	rm -f $(OUTPUTCSSFILES)
	rm -f $(OUTPUTJSFILES)
	rm -f $(WIDGET_DIR)/*/img/*_lastcopied
	rm -rf site/img
	rm -f site/$(WIDGET_DIR).js
	rm -f site/$(WIDGET_DIR).css

code: coffee site/$(WIDGET_DIR).js
	@echo "Compiled code into $(WIDGET_DIR).js"

style: $(OUTPUTCSSFILES) site/$(WIDGET_DIR).css
	@echo "Compiled CSS into $(WIDGET_DIR).css"

coffee: $(OUTPUTJSFILES)
	@echo "Compiled coffeescript into JS"

images: $(COPIEDIMAGES)
	@echo "Copied widget images across into site"

$(WIDGET_DIR)/%_lastcopied: $(WIDGET_DIR)/% | site/img/
	cp $(WIDGET_DIR)/$* site/img/
	@touch $@

site/img/:
	mkdir -p site/img

$(WIDGET_DIR)/%.css: $(WIDGET_DIR)/%.styl $(STYLUSFILES)
	stylus $<

$(WIDGET_DIR)/%.js: $(WIDGET_DIR)/%.coffee
	coffee -c $<

site/$(WIDGET_DIR).js: $(OUTPUTJSFILES)
	cat $^ > site/$(WIDGET_DIR).js

site/$(WIDGET_DIR).css: $(OUTPUTCSSFILES)
	cat $^ > site/$(WIDGET_DIR).css


