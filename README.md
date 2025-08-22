# Lazy Reminder

Lazy Reminder is a zero-friction reminder app for "lazy people". Capture photos or quick text, parse them into structured reminders, and stay on top of tasks without hassle. The app is local-first and private by default.

## Prerequisites
- macOS with Xcode 15+
- [Homebrew](https://brew.sh)
- Optional: [SwiftLint](https://github.com/realm/SwiftLint)

## Quick Start
```sh
brew install xcodegen
make bootstrap
open LazyReminder.xcodeproj
```

## Makefile Targets
- `make bootstrap` – install tools and generate the Xcode project
- `make generate` – regenerate the project using XcodeGen
- `make build` – build the LazyReminder scheme for iPhone 15 simulator
- `make test` – run unit and UI tests
- `make lint` – run SwiftLint if installed
- `make ci` – convenience target for CI

## Backend & EventKit
Backend stubs are located under `serverless/`:
- Node/Express: `cd serverless/node && npm install && node index.js`
- Python/FastAPI: `cd serverless/python && pip install -r requirements.txt && uvicorn main:app`
Copy `serverless/.env.example` to `.env` and configure API keys.

EventKit syncing is optional and disabled by default; enable it in Settings and grant calendar access.

## Cost Control
OCR is performed on-device. LLM extraction uses a small JSON-mode model via a tiny backend, called only when heuristics fail. Text is truncated to ~1000 characters to minimize token usage.

## License
Lazy Reminder is available under the MIT license. See [LICENSE](LICENSE).
