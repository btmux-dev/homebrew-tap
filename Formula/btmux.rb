class Btmux < Formula
  desc "Persistent terminal workspace for desktop, browser, and mobile"
  homepage "https://github.com/btmux-dev/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.224/btmux-aarch64-apple-darwin"
      sha256 "223fc0c22f261c8933f99f36b00c62a7e3d1258f3c05a0c9d31d02c0422c29d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.224/btmux-aarch64-unknown-linux-gnu"
      sha256 "64a88cdc1e7e509a36f8f6790b1b8884dff21317a634ba9ae3d55a77c00e572e"
    end
    on_intel do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.224/btmux-x86_64-unknown-linux-gnu"
      sha256 "4609cf816a7666c11ecb1881f74500ccb954bc1e01affda4d5e596da9f750a1f"
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
