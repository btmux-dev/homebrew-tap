cask "btmux" do
  version "0.0.225"
  sha256 "dda09be6d6e382733df9d9dc5614d3e927e9094aebfb171b53dcdcfde07e4dff"

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
