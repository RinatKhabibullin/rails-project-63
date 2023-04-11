install:
	bundle install
test:
	bundle exec rake test
lint:
	bundle exec rubocop -A
check: install test lint

.PHONY: test