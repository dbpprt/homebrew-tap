class Nauclio < Formula
  desc "Local daemon for durable AI coding-agent conversations"
  homepage "https://github.com/dbpprt/homebrew-tap"
  version "0.0.0"
  url "https://github.com/dbpprt/homebrew-tap/releases/download/v0.0.0/nauclio-darwin-arm64.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64
  depends_on "node"

  def install
    bin.install "nauclio-darwin-arm64/nauclio"
  end

  service do
    run [opt_bin/"nauclio", "daemon", "start", "--service"]
    keep_alive true
    restart_delay 5
    process_type :background
    environment_variables PATH: std_service_path_env
    log_path var/"log/nauclio-service.log"
    error_log_path var/"log/nauclio-service.log"
  end

  def caveats
    <<~EOS
      Complete GitHub authorization, register projects, and start the service:
        nauclio setup /path/to/git-project

      Inspect the daemon:
        nauclio daemon status
        nauclio daemon logs --follow

      Nauclio data remains in ~/.nauclio after uninstalling the formula.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nauclio version")
    assert_match "local-host", shell_output("#{bin}/nauclio --store #{testpath} status")
  end
end
