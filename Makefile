.PHONY: all
all: uniq.elc.sh uniq.fasl uniq.pyc

uniq.elc.sh:
	@$(MAKE) -C src/elisp
	echo '#!/bin/sh' > uniq.elc.sh
	echo "/usr/bin/emacs -x `realpath src/elisp/uniq.elc`" >> uniq.elc.sh
	@chmod -v +x uniq.elc.sh

uniq.fasl:
	@$(MAKE) -C src/common_lisp
	@ln -vs $(PWD)/src/common_lisp/uniq.fasl ./

uniq.pyc:
	@$(MAKE) -C src/python
	echo '#!/bin/sh' > uniq.pyc.sh
	echo "/usr/bin/python3 `realpath src/python/uniq.pyc`" >> uniq.pyc.sh
	@chmod -v +x uniq.pyc.sh

.PHONY: clean.elc.sh clean.fasl clean.pyc clean
clean.elc.sh:
	@rm -vf ./uniq.elc.sh
	@$(MAKE) -C src/elisp clean

clean.pyc:
	@rm -vf ./uniq.pyc
	@$(MAKE) -C src/python clean

clean.fasl:
	@rm -vf ./uniq.fasl
	@$(MAKE) -C src/common_lisp clean

clean: clean.elc.sh clean.pyc clean.fasl
