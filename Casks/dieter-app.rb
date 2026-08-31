cask "dieter-app" do
  version "0.4.79"
  sha256 "a0890077d1097cb7128f7787c92c1c156d494069cb520fb2f72c73e6d89f6ebd"

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
