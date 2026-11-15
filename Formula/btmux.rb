class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.204/btmux-aarch64-apple-darwin"
      sha256 "de029a93bf1f28d66122bd548076c367278e7a5328b826165bbd1bc2510b194c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.204/btmux-aarch64-unknown-linux-gnu"
      sha256 "409f480ca7358df84ffbd6706b94f577e6a4da9c2d63403cbc3db79b2c0a0cd4"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.204/btmux-x86_64-unknown-linux-gnu"
      sha256 "3d274d876b3b2294aa218fe0d851dca4011f3499b0c3ec00cb08be929189b4a5"
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
