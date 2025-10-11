
.PHONY: default compile all check clean distclean dev

default: compile
	bin/nanoc view

compile: .deps
	bin/nanoc compile

all: clean compile check

check: .deps
	bin/nanoc check internal_links external_links stale css html

clean:
	rm -rf output/

distclean: clean
	rm -rf tmp/ .bundle bin vendor

dev:
	bin/nanoc live

.PHONY: .deps bundler-env install-bundle install-bundle-devel install-bundle-ci

# default installation
.deps:
	@[ -e .bundle ] || $(MAKE) install-bundle
	@[ -e node_modules ] || $(MAKE) install-yarn

# gems
define bundle_install_with_stubs
	bundle install
	@echo "Making gems available"
	bundle binstubs --force nanoc
endef

bundler-env:
	@echo "Configuring bundler environment"
	bundle config set --local clean true
	bundle config set --local path vendor/bundle

install-bundle: bundler-env
	@echo "Installing only main gems, cleaning old gems"
	@bundle config set --local without development,test
	$(bundle_install_with_stubs)

install-bundle-devel: bundler-env
	@echo "Installing all gems, cleaning old gems"
	@bundle config unset --local without
	$(bundle_install_with_stubs)

install-bundle-ci: bundler-env
	@echo "Installing main and testing gems, cleaning old gems"
	@bundle config set --local deployment true
	@bundle config set --local without development
	$(bundle_install_with_stubs)

# nodes
.PHONY: install-yarn install-yarn-devel

install-yarn:
	yarn install
	yarn build

install-yarn-devel:
	yarn install
	yarn build:dev

# meta
.PHONY: install install-devel install-ci

install: install-bundle install-yarn

install-devel: install-bundle-devel install-yarn-devel

install-ci: install-bundle-ci install-yarn
