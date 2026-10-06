class Dieter < Formula
  desc "Local daemon for durable AI coding-agent conversations"
  homepage "https://github.com/dbpprt/homebrew-tap"
  url "https://github.com/dbpprt/dieter/releases/download/v0.4.379/dieter-darwin-arm64.tar.gz"
  version "0.4.379"
  sha256 "a11c51447b4ff0368f9e3dae0fc5264baa3a46c8b2b2e7838b7ba6e0dc226a4c"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "node"
  depends_on "tmux"

  def install
    bin.install "dieter", "dieter-capture"
  end

  post_install_steps do
    mkdir_p "dieter/service", base: :var
    run "bin/dieter", base: :prefix,
        args: ["__service-stage", "--root", "{{var}}/dieter/service"],
        writable_paths: ["dieter/service"], writable_base: :var
  end

  service do
    run [var/"dieter/service/bin/dieter", "daemon", "start", "--service",
         "--runtime", var/"dieter/service"]
    keep_alive true
    restart_delay 5
    process_type :background
    environment_variables PATH: std_service_path_env
    log_path var/"log/dieter-service.log"
    error_log_path var/"log/dieter-service.log"
  end

  def caveats
    <<~EOS
      Complete GitHub authorization and start the service:
        dieter setup /path/to/git-project

      Upgrades stage a signed release without changing the running service.
      Activate the staged release and refresh the service definition with:
        brew services restart dieter

      Check permissions through the running daemon:
        dieter daemon permissions --check

      When migrating from a Cellar service, grant Screen Recording and
      Accessibility access to #{var}/dieter/service/bin/dieter once.

      After uninstall, Dieter data remains in ~/.dieter and the service
      runtime remains in #{var}/dieter/service. Stop the service before
      uninstalling. Remove the runtime separately only when no longer needed.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dieter version")
    assert_match "running daemon", shell_output("#{bin}/dieter screen permissions --help")
  end
end
