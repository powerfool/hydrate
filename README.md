# Hydrate

> The biggest risk of using Claude Code is not cognitive offloading. It's dehydration.

**Hydrate** is a Claude Code plugin that reminds you to drink water and stand up every 45 minutes so you don't rot in your chair.

![Zight 2026-03-27 at 2 52 19 PM](https://github.com/user-attachments/assets/2f433e35-5932-4736-8511-b674a68919b8)


## Installation

Add the marketplace and install the plugin from within Claude Code:

```
/plugin marketplace add powerfool/hydrate
/plugin install hydrate@dimitris-plugins
```

## Requirements

Requires a Unix-based system (macOS or Linux). Windows users can run this via [WSL](https://learn.microsoft.com/en-us/windows/wsl/).

## How it works

The plugin registers a `UserPromptSubmit` hook that runs on every message. It tracks the last reminder time in `~/.hydrate_last_reminder`. If 45 minutes have elapsed, it injects a reminder into Claude's context, which Claude includes at the top of its next response.

Reminders alternate between two messages:
- Drink some water
- Stand up and stretch

State files: `~/.hydrate_last_reminder`, `~/.hydrate_counter`
