class Btmux < Formula
  desc "Persistent terminal workspace for desktop, browser, and mobile"
  homepage "https://github.com/btmux-dev/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.216/btmux-aarch64-apple-darwin"
      sha256 "f404ab822ae9f197820f591c2fe5f629ac4a73d498ccddef4794a9d09e645c66"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.216/btmux-aarch64-unknown-linux-gnu"
      sha256 "4115e3be3332e4dce5c203d5577841f61ed621b031682ac8b58a68d17eb0a1b2"
    end
    on_intel do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.216/btmux-x86_64-unknown-linux-gnu"
      sha256 "58c3afe23cf501d1906305b770dfcbc577a0564367625432429d02637facdd7a"
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
