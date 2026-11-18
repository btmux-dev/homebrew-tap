class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/btmux-dev/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.210/btmux-aarch64-apple-darwin"
      sha256 "9a88111017faf5138fff34b4bd2d7d82617f0e7cf48a3a427777fad484e5b4e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.210/btmux-aarch64-unknown-linux-gnu"
      sha256 "0b882e71fc128f3cf108eb8915f3eec323c0944abdf8c5fe032ef00ef9b0062c"
    end
    on_intel do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.210/btmux-x86_64-unknown-linux-gnu"
      sha256 "d13225a14689c98de9b47f3c8874272a9f9b5d03dd0347e52473910fdb46c36c"
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
