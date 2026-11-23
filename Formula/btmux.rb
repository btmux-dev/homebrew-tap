class Btmux < Formula
  desc "Persistent terminal workspace for desktop, browser, and mobile"
  homepage "https://github.com/btmux-dev/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.220/btmux-aarch64-apple-darwin"
      sha256 "87e0e4d37a7ea0be44d1ea89732ef5a31719cdfb19284b27d1a20aa005b63c44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.220/btmux-aarch64-unknown-linux-gnu"
      sha256 "6e4c79716f0fafe5bf0e2b732b9bbc79b0eacd1e341210558041a305f2e5f193"
    end
    on_intel do
      url "https://github.com/btmux-dev/btmux/releases/download/v0.0.220/btmux-x86_64-unknown-linux-gnu"
      sha256 "4dd8b55fc6feab46949411f18fdd62ca865096f85ffa059d46fd08b074773ced"
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
