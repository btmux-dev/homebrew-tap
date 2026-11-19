class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/btmux-dev/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.213/btmux-aarch64-apple-darwin"
      sha256 "fd8498229b2e47e1d6352838de70b807e40be2ce657dfc59a102938a6b229d81"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.213/btmux-aarch64-unknown-linux-gnu"
      sha256 "d5ecb886d723585c9e54ecca0872f523000160e8d24d5bcda15dc1ac89443425"
    end
    on_intel do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.213/btmux-x86_64-unknown-linux-gnu"
      sha256 "0c3f1e1c1659d794c0d35b14edbb958f746b41aafa19284e868c6b086bb8d49d"
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
