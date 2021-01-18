
.PHONY: default compile all check clean bundler-env install install-devel

default: compile
	bin/nanoc view

compile: .bundle
	bin/nanoc compile

all: clean compile check

check: .bundle
	bin/nanoc check internal_links external_links stale css html

clean:
	rm -rf output/

distclean: clean
	rm -rf tmp/ .bundle bin vendor

# default installation
.bundle:
	@[ -e .bundle ] || $(MAKE) install

bundler-env:
	@echo "Configuring bundler environment"
	bundle config set --local clean true
	bundle config set --local path vendor/bundle

install: bundler-env
	@echo "Installing only main gems, cleaning old gems"
	@bundle config set --local without nanoc,test
	bundle install
	@echo "Making gems available"
	bundle binstubs --force nanoc

install-devel: bundler-env
	@echo "Installing all gems, cleaning old gems"
	@bundle config unset --local without
	bundle install
	@echo "Making gems available"
	bundle binstubs --force nanoc guard
