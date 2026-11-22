class Btmux < Formula
  desc "Persistent terminal workspace for desktop, browser, and mobile"
  homepage "https://github.com/btmux-dev/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.217/btmux-aarch64-apple-darwin"
      sha256 "934a1847fbe26d1418583ee6ead5c796638dd19c887973170cf06d373fecb39b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.217/btmux-aarch64-unknown-linux-gnu"
      sha256 "e11ba0e90a707e230234988ebe53c4f2bf1f364e7cb5f5b379ccf8e374b9af59"
    end
    on_intel do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.217/btmux-x86_64-unknown-linux-gnu"
      sha256 "2738adf0f4408454313540d89d69326c48c0cd0e6d5776db87f1015c175afa15"
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
