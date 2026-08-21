cask "nauclio-app" do
  version "0.4.27"
  sha256 "91076a0aad0955f9525521a444ec3e78fe2ef8d64d749b63e5d3ffb138c0cc96"

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
