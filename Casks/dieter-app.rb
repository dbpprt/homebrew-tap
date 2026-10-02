cask "dieter-app" do
  version "0.4.353"
  sha256 "47527967ff2fe4ab920f7602382135a0de9207c7ba33f95fa5c13ed7ef6ebf8f"

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
