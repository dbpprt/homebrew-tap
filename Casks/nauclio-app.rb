cask "nauclio-app" do
  version "0.4.23"
  sha256 "157685bb47ff80dbe01f6ef22b3dbcbb5faf58ac0cfb39bad5817f3ed3c4ddbd"

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
