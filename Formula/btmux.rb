class Btmux < Formula
  desc "Persistent terminal workspace for desktop, browser, and mobile"
  homepage "https://github.com/btmux-dev/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.218/btmux-aarch64-apple-darwin"
      sha256 "868d87e47e1e3f56c1c53e332e504704b955876062cb63f5741f5f5027adcbde"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.218/btmux-aarch64-unknown-linux-gnu"
      sha256 "ca0c8b5433ca8b2901f0d11a02358b19bb75b125826db5402159acc102aa8818"
    end
    on_intel do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.218/btmux-x86_64-unknown-linux-gnu"
      sha256 "6eac675fe522aed521f0a89bac1e95c088678d73fb5d237954b177466d03d7e5"
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
