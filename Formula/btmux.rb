class Btmux < Formula
  desc "Persistent terminal workspace for desktop, browser, and mobile"
  homepage "https://github.com/btmux-dev/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.226/btmux-aarch64-apple-darwin"
      sha256 "d698192d34b465a2bbe0838fcea08b28d90b170c150ac81aef5c660dbcc8a96f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.226/btmux-aarch64-unknown-linux-gnu"
      sha256 "3a0dec28b7694674595090b6b7374603fe47eb95b6f19a18e42d64303bbf33d8"
    end
    on_intel do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.226/btmux-x86_64-unknown-linux-gnu"
      sha256 "380c789e65f875784b7b7506a97da790b126f1169349cb188ebbaf0b9f21ffee"
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
