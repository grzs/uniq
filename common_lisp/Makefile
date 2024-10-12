uniq.fasl:
	sbcl --non-interactive --eval '(compile-file "uniq.lisp")'
	@chmod -v +x ./uniq.fasl

.PHONY: clean
clean:
	@rm -vf ./uniq.fasl
