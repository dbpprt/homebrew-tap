cask "dieter-app" do
  version "0.4.375"
  sha256 "64f5a62cf2491c82dd518e3829b2e34018eefaee1e5fa2177dadf9e73f12df80"

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

  zap trash: "~/Library/Application Support/com.dbpprt.dieter.mac"
end
