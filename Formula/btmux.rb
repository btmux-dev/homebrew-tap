class Btmux < Formula
  desc "Persistent terminal workspace for desktop, browser, and mobile"
  homepage "https://github.com/btmux-dev/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.214/btmux-aarch64-apple-darwin"
      sha256 "692b071147e67f8854eb711715b5c49b962f08555741d0398a1daac2af3cc78e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.214/btmux-aarch64-unknown-linux-gnu"
      sha256 "493c68d2e6edb1467b48b2868a907a36dedca2eab82f42cfee8e98b2893b7e61"
    end
    on_intel do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.214/btmux-x86_64-unknown-linux-gnu"
      sha256 "36d9ff3a2d6c56c09a75f9865f9dde0e1f5db2bda6ef97f5aada9e01085df3ee"
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
