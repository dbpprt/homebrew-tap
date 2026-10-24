# Rendered into dbpprt/homebrew-tap Formula/dieter.rb by `fastlane promote` from
# config/identity.json and the promoted release. Edit this template, not the tap.
class Dieter < Formula
  desc "Local daemon for durable AI coding-agent conversations"
  homepage "https://github.com/dbpprt/dieter"
  url "https://github.com/dbpprt/dieter/releases/download/v0.6.425/dieter-darwin-arm64.tar.gz"
  version "0.6.425"
  sha256 "5ce6790fd59a2ff5cbb64f5c21805813d2a861c789a0b6cae46c8be9cd55a169"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "node"
  depends_on "tmux"

  def install
    bin.install "dieter", "dieter-capture"
    libexec.install "DieterPrivacyHelper.app"
  end

  post_install_steps do
    mkdir_p "dieter/service", base: :var
    run "bin/dieter", base: :prefix,
        args: ["__service-stage", "--root", "{{var}}/dieter/service",
               "--bundle-prefix", "../libexec"],
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
        dieter setup

      Setup also registers the background privacy helper. Approve Dieter Privacy
      Helper in Login Items & Extensions and grant Input Monitoring when prompted.
      Privacy stays off until explicitly enabled. Register projects separately:
        dieter project open /path/to/git-project

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
