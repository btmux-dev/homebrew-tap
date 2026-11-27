class Btmux < Formula
  desc "Persistent terminal workspace for desktop, browser, and mobile"
  homepage "https://github.com/btmux-dev/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.225/btmux-aarch64-apple-darwin"
      sha256 "5756395791d6a0f40d27780698ef6a1e5202b261aaf7ef796056cbf89f30f21b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.225/btmux-aarch64-unknown-linux-gnu"
      sha256 "ac3bef7021c8fa47514536bd698ee6e3d092b6ff7ca463a1f74b0ee4def0bd44"
    end
    on_intel do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.225/btmux-x86_64-unknown-linux-gnu"
      sha256 "b2ffcc03e512c201ff40efc91ed4809ca7bacf84375ef7dbc71204ed88e43d3c"
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
