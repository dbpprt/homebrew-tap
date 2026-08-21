cask "nauclio-app" do
  version "0.4.26"
  sha256 "38ce1444e2fe195819c25b65ccb2d7cf78c7710bf95179d467cc0161a4a9853b"

  url "https://github.com/dbpprt/homebrew-tap/releases/download/v#{version}/Nauclio-macOS-arm64.zip"
  name "Nauclio"
  desc "Native client for durable local AI coding-agent conversations"
  homepage "https://github.com/dbpprt/nauclio"

  depends_on arch: :arm64
  depends_on :macos

  app "Nauclio.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Nauclio.app"]
  end

  zap trash: "~/Library/Application Support/com.dbpprt.nauclio.mac"
end
