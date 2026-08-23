cask "dieter-app" do
  version "0.4.32"
  sha256 "bcbb895e260e6e4fb13b4811c71e07870fafccf52d4c1a1235b6b098f22debcd"

  url "https://github.com/dbpprt/homebrew-tap/releases/download/v#{version}/Dieter-macOS-arm64.zip"
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
    "~/Library/Application Support/com.dbpprt.dieter.mac",
    "~/Library/Application Support/com.dbpprt.nauclio.mac",
  ]
end
