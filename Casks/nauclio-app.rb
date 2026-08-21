cask "nauclio-app" do
  version "0.4.25"
  sha256 "239e8ee0510b9a2ebae5def62b4bc738f52ba19f04e7fcd74ff92197624ae098"

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
