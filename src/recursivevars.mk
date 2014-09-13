one=$(two)
two=$(three)
three=hello world

all:
	@echo $(one)
