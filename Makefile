.PHONY: build
build:
	docker compose build --no-cache

.PHONY: keyball44-via
keyball44-via:
	docker compose run --rm builder make SKIP_GIT=yes keyball/keyball44:via