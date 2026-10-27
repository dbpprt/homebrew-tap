# Rendered into dbpprt/homebrew-tap Casks/dieter-app.rb by `fastlane promote` from
# config/identity.json and the promoted release. Edit this template, not the tap.
cask "dieter-app" do
  version "0.6.430"
  sha256 "4d1591dbe99bec45bf48b803fdf62c56e20cb3eda8ce62fa0c2f5efcc597e031"

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
