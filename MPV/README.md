# [mpv](https://mpv.io/)

> a free, open source, and cross-platform media player

## Installation

```bash
brew install mpv
```

The `mpv` cask was disabled upstream on 2026-09-01 because it fails the macOS
Gatekeeper check, so install the formula. It gives the `mpv` CLI, not an app
bundle.

## Symlink Config Files

```bash
ln -s ~/.dotfiles/MPV ~/.config/mpv
```

`~/.mpv` was the pre-0.5 location and is no longer read.
