cask "dieter-app" do
  version "0.5.404"
  sha256 "0d37805042cb5ff455d98ac403009ec0485e05a7781bb04da95ae8f4abe50885"

  url "https://github.com/dbpprt/dieter/releases/download/v0.5.404/Dieter-macOS-arm64.zip"
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
