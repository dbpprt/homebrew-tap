cask "nauclio-app" do
  version "0.4.15"
  sha256 "fd5de68ce85e802e89948fde9994bd54ab74339368151bef1d5aba8e9fafe15e"

  url "https://github.com/dbpprt/homebrew-tap/releases/download/v#{version}/Nauclio-macOS-arm64.zip"
  name "Nauclio"
  desc "Native client for durable local AI coding-agent conversations"
  homepage "https://github.com/dbpprt/nauclio"

  depends_on arch: :arm64
  depends_on :macos

  app "Nauclio.app"

  zap trash: "~/Library/Application Support/com.dbpprt.nauclio.mac"
end
