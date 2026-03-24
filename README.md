# Hydrate

> The biggest risk of using Claude Code is not cognitive offloading. It's dehydration.

**Hydrate** is a Claude Code plugin that reminds you to drink water and stand up every 45 minutes so you don't rot in your chair.


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
