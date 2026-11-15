class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.205/btmux-aarch64-apple-darwin"
      sha256 "e9276adf88debfc0cc85477b8cac9b7cd9fcfd3bb4aca8ded6a921a96be68c2f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.205/btmux-aarch64-unknown-linux-gnu"
      sha256 "91c4dee08bca126cee64fb0c997bf12a36c36f8953d5a6bc4cb5f177dc223869"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.205/btmux-x86_64-unknown-linux-gnu"
      sha256 "30d07641e1b367e4ff5f714cf9be98d16078dd94bd6b877da071c2ddee00c378"
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
