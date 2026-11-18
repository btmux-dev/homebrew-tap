class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.208/btmux-aarch64-apple-darwin"
      sha256 "8606976e81dc39984083c645b079b72aa60308a3b4c72470a926fe040230b198"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.208/btmux-aarch64-unknown-linux-gnu"
      sha256 "f1f97830c6c1faf94b8ab485e64669f9d47cd2333ff38278b9d2c769fff253b1"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.208/btmux-x86_64-unknown-linux-gnu"
      sha256 "deeec8dd571d4a10bcc7f41eb92d5673ccf904bb6ed62d01c14209ac51e3055f"
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
