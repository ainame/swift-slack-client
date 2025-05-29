generate:
	./scripts/generate_all.sh

clean:
	mkdir -p ./.tmp
	rm -rf ./.tmp/*
	find Sources -type d -name Generated -exec rm -rf {} +
	@echo "Resetting submodules to clean state..."
	@if [ -e ".dependencies/java-slack-sdk/.git" ]; then \
		cd .dependencies/java-slack-sdk && git reset --hard HEAD && git clean -fd; \
	fi
	@if [ -e ".dependencies/slack-api-ref/.git" ]; then \
		cd .dependencies/slack-api-ref && git reset --hard HEAD && git clean -fd; \
	fi
	git submodule update --init --recursive
	@echo "Clean complete"

format:
	swiftformat Sources/ Examples/ Tests/

update:
	@echo "Initializing and updating git submodules..."
	@if [ ! -f ".gitmodules" ]; then \
		echo "No .gitmodules file found. Setting up submodules..."; \
		git submodule add https://github.com/slackapi/java-slack-sdk.git .dependencies/java-slack-sdk || true; \
		git submodule add https://github.com/slack-ruby/slack-api-ref.git .dependencies/slack-api-ref || true; \
	fi
	@git submodule init
	@git submodule update --remote --merge
	@echo "Submodules updated to latest main/master branch"
