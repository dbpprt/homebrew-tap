# Homebrew Tap for Dieter

Install the Apple Silicon Dieter daemon:

```sh
brew install dbpprt/tap/dieter
dieter setup ~/Development/my-project
```

Install the Apple Silicon macOS app:

```sh
brew install --cask dbpprt/tap/dieter-app
```

The daemon and app are installed and upgraded independently by Homebrew but
published from the same Dieter release tag.

Useful service commands:

```sh
dieter daemon status
dieter daemon logs --follow
brew services restart dieter
brew upgrade dieter
```

Dieter stores its state and managed logs under `DIETER_HOME`, which defaults to
`~/.dieter`. Uninstalling the formula does not delete that data.
