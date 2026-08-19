# Homebrew Tap for Nauclio

Install the Apple Silicon Nauclio daemon:

```sh
brew install dbpprt/tap/nauclio
nauclio setup ~/Development/my-project
```

Install the Apple Silicon macOS app:

```sh
brew install --cask dbpprt/tap/nauclio-app
```

The daemon and app are installed and upgraded independently by Homebrew but
published from the same Nauclio release tag.

Useful service commands:

```sh
nauclio daemon status
nauclio daemon logs --follow
brew services restart nauclio
brew upgrade nauclio
```

Nauclio stores its state and managed logs under `NAUCLIO_HOME`, which defaults
to `~/.nauclio`. Uninstalling the formula does not delete that data.
