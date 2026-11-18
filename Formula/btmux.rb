class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/btmux-dev/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.211/btmux-aarch64-apple-darwin"
      sha256 "615950a7e40143a5de53cba70bc33fb8715b17a11699c414e2a8190b6469ffb3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.211/btmux-aarch64-unknown-linux-gnu"
      sha256 "24c7a02bd8af07689ad668f6b6b648c9a52704d1def51a986de15ab91ff751c4"
    end
    on_intel do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.211/btmux-x86_64-unknown-linux-gnu"
      sha256 "ced2b24d946b8c22d4217042aeb7410c763a78bb44f1fcf0934c1e07314c0af9"
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
