class Dieter < Formula
  desc "Local daemon for durable AI coding-agent conversations"
  homepage "https://github.com/dbpprt/homebrew-tap"
  url "https://github.com/dbpprt/homebrew-tap/releases/download/v0.4.65/dieter-darwin-arm64.tar.gz"
  version "0.4.65"
  sha256 "71b90215368050f8d4f147148e476199f1a9b5872d0edbd189be846dc60b0990"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "node"

  def install
    bin.install "dieter", "dieter-capture"
  end

  service do
    run [opt_bin/"dieter", "daemon", "start", "--service"]
    keep_alive true
    restart_delay 5
    process_type :background
    environment_variables PATH: std_service_path_env
    log_path var/"log/dieter-service.log"
    error_log_path var/"log/dieter-service.log"
  end

  def caveats
    <<~EOS
      Complete GitHub authorization, register projects, and start the service:
        dieter setup /path/to/git-project

      Inspect the daemon:
        dieter daemon status
        dieter daemon logs --follow

      Dieter data remains in ~/.dieter after uninstalling the formula.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dieter version")
    assert_match "local-host", shell_output("#{bin}/dieter --store #{testpath} status")
  end
end
