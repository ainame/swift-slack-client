generate:
	./scripts/generate_all.sh

clean:
	mkdir -p ./.tmp
	rm -rf ./.tmp/*
	find Sources -type d -name Generated -exec rm -rf {} +

format:
	swiftformat Sources/ Examples/ Tests/
