# Rendered into dbpprt/homebrew-tap Casks/dieter-app.rb by `fastlane promote` from
# config/identity.json and the promoted release. Edit this template, not the tap.
cask "dieter-app" do
  version "0.6.410"
  sha256 "eb66c239eccc8b2ce7a62b5fa749270873a8bbfef4931262d7e1158bb111e9ce"

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
