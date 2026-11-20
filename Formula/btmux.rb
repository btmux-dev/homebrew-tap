class Btmux < Formula
  desc "Persistent terminal workspace for desktop, browser, and mobile"
  homepage "https://github.com/btmux-dev/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.215/btmux-aarch64-apple-darwin"
      sha256 "d926caa7873349110fc311c9503627b6eae772a2a8fcbcfadad5fad0f593a283"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.215/btmux-aarch64-unknown-linux-gnu"
      sha256 "2dd4f182637f6cd9662c0f55c0b1ea3cc6e2948d520e3d579855d94011aeb8e2"
    end
    on_intel do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.215/btmux-x86_64-unknown-linux-gnu"
      sha256 "36ae75829db1441f70aa4f7d20870c969b374f3b128c11dc84c4e9f6620494a0"
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
