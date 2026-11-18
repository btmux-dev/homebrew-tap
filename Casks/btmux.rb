cask "btmux" do
  version "0.0.211"
  sha256 "cbd1d5c25956559c05df990142a16b2cf3b052445c235e534e1ab4673fbfc697"

  url "https://github.com/btmux-dev/btmux/releases/download/v#{version}/btmux-desktop-aarch64-apple-darwin.zip"
  name "btmux"
  desc "Desktop client for btmux"
  homepage "https://github.com/btmux-dev/btmux"

  depends_on arch: :arm64

  app "btmux.app"

  zap trash: [
    "~/Library/Application Support/btmux-desktop",
    "~/Library/Application Support/com.btmux.desktop",
    "~/Library/Caches/btmux-desktop",
    "~/Library/Caches/com.btmux.desktop",
    "~/Library/WebKit/btmux-desktop",
    "~/Library/WebKit/com.btmux.desktop",
  ]
end
