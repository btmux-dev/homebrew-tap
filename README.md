# homebrew-tap

Homebrew tap for [btmux](https://github.com/btmux-dev/btmux), a terminal
emulator and tmux-style session manager. See the
[docs](https://btmux-dev.github.io/btmux/start/installation/) for more.

```sh
brew install --cask btmux-dev/tap/btmux   # desktop app (Apple Silicon macOS)
brew install btmux-dev/tap/btmux          # server and CLI (Apple Silicon macOS, Linux)
```

The desktop app is signed and notarized.

The btmux release workflow updates the formula and cask with
[`scripts/update-homebrew-tap.sh`](https://github.com/btmux-dev/btmux/blob/main/scripts/update-homebrew-tap.sh).
