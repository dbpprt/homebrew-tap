cask "dieter-app" do
  version "0.4.35"
  sha256 "0f9f62f2880a523063b64f71e7f36e57a8739640587a8184b790ee4696e78c38"

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
