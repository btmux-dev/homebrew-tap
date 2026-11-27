class Btmux < Formula
  desc "Persistent terminal workspace for desktop, browser, and mobile"
  homepage "https://github.com/btmux-dev/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.223/btmux-aarch64-apple-darwin"
      sha256 "1a92bcca64cef4b01b0723553c6332b8bd1d07187bacff597030e86b55a30829"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.223/btmux-aarch64-unknown-linux-gnu"
      sha256 "ab10bc344a2ad7772b6870cb414de6c2e3d60ff6b7818fd94c115c55964de0f5"
    end
    on_intel do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.223/btmux-x86_64-unknown-linux-gnu"
      sha256 "27f8cc761a1379040b568b41ec13f9dabd639b35f58a1127b142aece24973489"
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
