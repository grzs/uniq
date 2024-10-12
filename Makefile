.PHONY: all
all: uniq.elc uniq.fasl uniq.pyc

uniq.elc:
	@$(MAKE) -C src/elisp
	@cp -v src/elisp/uniq.elc ./

uniq.fasl:
	@$(MAKE) -C src/common_lisp
	@cp -v src/common_lisp/uniq.fasl ./

uniq.pyc:
	@$(MAKE) -C src/python
	@cp -v src/python/uniq.pyc ./

.PHONY: clean.elc clean.fasl clean.pyc clean
clean.elc:
	@rm -vf ./uniq.elc
	@$(MAKE) -C src/elisp clean

clean.pyc:
	@rm -vf ./uniq.pyc
	@$(MAKE) -C src/python clean

clean.fasl:
	@rm -vf ./uniq.fasl
	@$(MAKE) -C src/common_lisp clean

clean: clean.elc clean.pyc clean.fasl
