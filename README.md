# JasonHZS/homebrew-tap

Homebrew casks for [Pitwall](https://pitwall.oasislab.dev), a local macOS board for Codex, Claude Code, Cursor, Pi and Devin sessions.

```sh
brew install --cask jasonhzs/tap/pitwall
pitwall-collector install
```

The second command enables event collection for every supported agent (list some to pick them, e.g. `pitwall-collector install codex claude-code`). Upgrade with `brew upgrade --cask pitwall`.

Releases and the collector source live in [JasonHZS/pitwall-collector](https://github.com/JasonHZS/pitwall-collector).
