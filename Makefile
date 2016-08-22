VERSION = $(shell python setup.py --version)

test:
	python setup.py test

release: test
	-git tag $(VERSION)
	git push origin $(VERSION)
	git push origin master
	python2.6 setup.py sdist upload --repository ${PYPI}

watch:
	bundle exec guard

recorder/test_results/xunit:
	mkdir -p recorder/test_results/xunit

.PHONY: test release watch
