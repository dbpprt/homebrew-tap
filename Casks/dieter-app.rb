cask "dieter-app" do
  version "0.4.34"
  sha256 "a2b5dbc5327fb9aad86d971908fb4d22b80f0265b0638af81d8b48c6d05c0e4e"

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
