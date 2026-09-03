class Dieter < Formula
  desc "Local daemon for durable AI coding-agent conversations"
  homepage "https://github.com/dbpprt/homebrew-tap"
  url "https://github.com/dbpprt/homebrew-tap/releases/download/v0.4.90/dieter-darwin-arm64.tar.gz"
  version "0.4.90"
  sha256 "49c474d77e01e5804412f0ba060d430ad32f1563d783aec639bbea0574b0d655"
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
