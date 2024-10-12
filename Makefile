.PHONY: all
all: uniq.elc uniq.fasl uniq.pyc

uniq.elc:
	@$(MAKE) -C elisp
	@cp -v elisp/uniq.elc ./

uniq.fasl:
	@$(MAKE) -C common_lisp
	@cp -v common_lisp/uniq.fasl ./

uniq.pyc:
	@$(MAKE) -C python
	@cp -v python/uniq.pyc ./

.PHONY: clean.elc clean.fasl clean.pyc clean
clean.elc:
	@rm -vf ./uniq.elc
	@$(MAKE) -C elisp clean

clean.pyc:
	@rm -vf ./uniq.pyc
	@$(MAKE) -C python clean

clean.fasl:
	@rm -vf ./uniq.fasl
	@$(MAKE) -C common_lisp clean

clean: clean.elc clean.pyc clean.fasl
