uniq.elc:
	/usr/bin/emacs --batch --eval '(byte-compile-file "./uniq.el")'
	@chmod -v +x ./uniq.elc

.PHONY: clean
clean:
	@rm -vf ./uniq.elc
