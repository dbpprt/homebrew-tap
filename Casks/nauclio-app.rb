cask "nauclio-app" do
  version "0.4.2"
  sha256 "0ba379cb05cc556e5b17a9b694176b7ea42106456ef8b9afd13ecf2eb4947f26"

  url "https://github.com/dbpprt/homebrew-tap/releases/download/v#{version}/Nauclio-macOS-arm64.zip"
  name "Nauclio"
  desc "Native client for durable local AI coding-agent conversations"
  homepage "https://github.com/dbpprt/nauclio"

  depends_on arch: :arm64
  depends_on :macos

  app "Nauclio.app"

  zap trash: "~/Library/Application Support/com.dbpprt.nauclio.mac"
end
