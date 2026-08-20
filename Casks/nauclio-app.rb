cask "nauclio-app" do
  version "0.0.21"
  sha256 "907fc3200683264907884db88601888aae9d9f64bf91e4aca9d1b07eb58c7585"

  url "https://github.com/dbpprt/homebrew-tap/releases/download/v#{version}/Nauclio-macOS-arm64.zip"
  name "Nauclio"
  desc "Native client for durable local AI coding-agent conversations"
  homepage "https://github.com/dbpprt/nauclio"

  depends_on arch: :arm64
  depends_on :macos

  app "Nauclio.app"

  zap trash: "~/Library/Application Support/com.dbpprt.nauclio.mac"
end
