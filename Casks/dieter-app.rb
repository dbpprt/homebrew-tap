cask "dieter-app" do
  version "0.4.293"
  sha256 "a10cb1eeb2fea429826b320221c5a713346f20d5eb0b8953219188e861cfd3fd"

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
