class Btmux < Formula
  desc "Persistent terminal workspace for desktop, browser, and mobile"
  homepage "https://github.com/btmux-dev/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.219/btmux-aarch64-apple-darwin"
      sha256 "fe30d15fcb64402da0b13232b7ed5f7b9f92d3214e4011387630d9a4f4b42bf3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.219/btmux-aarch64-unknown-linux-gnu"
      sha256 "43bafadac34274e5745c074c4e5fe778a8570783ef1fc310390978b258a35c1a"
    end
    on_intel do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.219/btmux-x86_64-unknown-linux-gnu"
      sha256 "4694a85d413ad42705893c4e76b72acb41c79fb668c18f1b81c0570e9f96e26d"
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
