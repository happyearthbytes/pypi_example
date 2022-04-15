


default:
	@./start.sh
configure:
	@./scripts/python/configure.sh --path py_app
install:
build:
	@./scripts/python/build.sh --path py_app
docs:
	@./scripts/python/docs.sh --path py_app
run:
	@./scripts/python/run.sh --path py_app --app app
scan:
	@./scripts/python/scan.sh --path py_app
test:
	@./scripts/python/test.sh --path py_app
clean:
	@./scripts/clean.sh