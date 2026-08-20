cask "nauclio-app" do
  version "0.4.22"
  sha256 "af3e44ffff44b086be93576ad819e3877732f9f7a33bab6f9def93db82e231db"

  url "https://github.com/dbpprt/homebrew-tap/releases/download/v#{version}/Nauclio-macOS-arm64.zip"
  name "Nauclio"
  desc "Native client for durable local AI coding-agent conversations"
  homepage "https://github.com/dbpprt/nauclio"

  depends_on arch: :arm64
  depends_on :macos

  app "Nauclio.app"

  zap trash: "~/Library/Application Support/com.dbpprt.nauclio.mac"
end
