class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/btmux-dev/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.212/btmux-aarch64-apple-darwin"
      sha256 "df11f0e98179e5260daae86f83b7b969bc3664f12d9a0ddd08d846ec6d7efa63"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.212/btmux-aarch64-unknown-linux-gnu"
      sha256 "69cd06cb317bb6cbf53567a08f9aaec33e0653553aaf6f5c3b07d8682a3952d5"
    end
    on_intel do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.212/btmux-x86_64-unknown-linux-gnu"
      sha256 "b19bcad89cc23f3f734e97b756b78f7cd071248c548afeb79e72d8fb2af4b8c0"
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
