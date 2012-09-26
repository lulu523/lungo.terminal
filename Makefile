NPM_EXECUTABLE_HOME := node_modules/.bin

PATH := ${NPM_EXECUTABLE_HOME}:${PATH}

dev: generate-js
	@coffee -wc --bare -o lib src/*.coffee

generate-js:
	@find src -name '*.coffee' | xargs coffee -c -o lib

package:
	@bin/lungo -c lungo
	@chmod 0755 lungo/bin/lungo

remove-js:
	@rm -fr lib/

deps:

.PHONY: all
