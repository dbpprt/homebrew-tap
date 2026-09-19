cask "dieter-app" do
  version "0.4.206"
  sha256 "f22d94d6f0ee13f35c68f9ce8e74d1d7280090cd2860f185e923f2c5a8187b8a"

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

  zap trash: "~/Library/Application Support/com.dbpprt.dieter.mac"
end
