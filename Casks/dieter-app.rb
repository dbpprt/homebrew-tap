# Rendered into dbpprt/homebrew-tap Casks/dieter-app.rb by `fastlane promote` from
# config/identity.json and the promoted release. Edit this template, not the tap.
cask "dieter-app" do
  version "0.6.421"
  sha256 "1a2b66a80e2dc919b8cc7cdf7423c6c06fa3ccdcd342e36b9bd32d7894810d2e"

  url "https://github.com/dbpprt/dieter/releases/download/v#{version}/Dieter-macOS-arm64.zip"
  name "Dieter"
  desc "Native client for durable local AI coding-agent conversations"
  homepage "https://github.com/dbpprt/dieter"

  depends_on arch: :arm64
  depends_on :macos

  app "Dieter.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Dieter.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.getdieter.mac",
    "~/Library/Caches/com.getdieter.mac",
    "~/Library/HTTPStorages/com.getdieter.mac",
    "~/Library/Preferences/com.getdieter.mac.plist",
    "~/Library/Saved Application State/com.getdieter.mac.savedState",
  ]
end
