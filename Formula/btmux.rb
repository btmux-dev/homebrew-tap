class Btmux < Formula
  desc "Persistent terminal workspace for desktop, browser, and mobile"
  homepage "https://github.com/btmux-dev/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.221/btmux-aarch64-apple-darwin"
      sha256 "1c9201d585ba9228adb664ccd00d464ee6e781182429c41b7dfac7c8ced0a1b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.221/btmux-aarch64-unknown-linux-gnu"
      sha256 "f50ba16c62a82edfc84a01c34353beb0e8d9b970f501fcf3f319db02ef71113f"
    end
    on_intel do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.221/btmux-x86_64-unknown-linux-gnu"
      sha256 "bd679376c0963690ac5c0b8ed10b309db5def0bf46e9b2cd246c9870a3b3f9e6"
    end
  end

  def install
    bin.install Dir["btmux-*"].first => "btmux"
  end

  def caveats
    <<~EOS
      A running background service keeps the old version until restarted:
        btmux restart
      If you installed it with an older btmux, re-run `btmux install` once so
      it follows future upgrades.
    EOS
  end

  test do
    assert_match "Browser-based tmux", shell_output("#{bin}/btmux --help")
  end
end
