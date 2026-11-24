class Btmux < Formula
  desc "Persistent terminal workspace for desktop, browser, and mobile"
  homepage "https://github.com/btmux-dev/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.222/btmux-aarch64-apple-darwin"
      sha256 "db78b4eab88b4dae789758dcfe9b5362364d33b5c1f70ffe3fa21fee5cc64ff3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.222/btmux-aarch64-unknown-linux-gnu"
      sha256 "cddbac73a844746233effa8c7fc363030d08211d86e3946a80572894b3aeab8a"
    end
    on_intel do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.222/btmux-x86_64-unknown-linux-gnu"
      sha256 "66d35ba58110304476f9eacc4dbd47b02567250a29aba87a5626706d6a2de7c1"
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
