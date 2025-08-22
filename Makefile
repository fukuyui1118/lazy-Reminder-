.PHONY: bootstrap generate build test lint ci

SCHEME=LazyReminder
DESTINATION='platform=iOS Simulator,name=iPhone 15'

bootstrap:
	brew list xcodegen >/dev/null 2>&1 || brew install xcodegen
	@if command -v swiftlint >/dev/null 2>&1; then echo "SwiftLint already installed"; else echo "SwiftLint not installed (optional)"; fi
	$(MAKE) generate

generate:
	xcodegen generate

build:
	xcodebuild -scheme $(SCHEME) -destination $(DESTINATION) build

test:
	xcodebuild -scheme $(SCHEME) -destination $(DESTINATION) test

lint:
	@if command -v swiftlint >/dev/null 2>&1; then swiftlint; else echo "SwiftLint not installed"; fi

ci: generate build test
