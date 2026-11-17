class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.207/btmux-aarch64-apple-darwin"
      sha256 "03838985a8df1f571e91fc8836a677bad8fbf2f2a52d5fe2c8cd2bce0d960e4c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.207/btmux-aarch64-unknown-linux-gnu"
      sha256 "9389b526e2a309ecdbc8197d6503455a16593bad5d537fa0bc2084df14239206"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.207/btmux-x86_64-unknown-linux-gnu"
      sha256 "6af6f57e519339eb1bdaf2aa1cb6c345ed6f453cbf051c6526ee4decebaf07be"
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
