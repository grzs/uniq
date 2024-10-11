.PHONY: all
all: uniq.elc uniq.pyc

uniq.elc:
	@$(MAKE) -C elisp
	@cp -v elisp/uniq.elc ./

uniq.pyc:
	@$(MAKE) -C python
	@cp -v python/uniq.pyc ./

.PHONY: clean.elc clean.pyc clean
clean.elc:
	@rm -vf ./uniq.elc
	@$(MAKE) -C elisp clean

clean.pyc:
	@rm -vf ./uniq.pyc
	@$(MAKE) -C python clean

clean: clean.elc clean.pyc
