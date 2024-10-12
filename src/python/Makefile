uniq.pyc:
	py3compile -v uniq.py
	@cp -v ./__pycache__/*.pyc ./uniq.pyc
	@chmod -v +x ./uniq.pyc

.PHONY: clean
clean:
	@rm -rfv ./__pycache__
	@rm -vf ./uniq.pyc
