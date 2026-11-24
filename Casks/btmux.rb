cask "btmux" do
  version "0.0.222"
  sha256 "67169e73a12f8438d9f3bd448ba8668fe7bbc93dbbe654ab3c04dbcd46d7f720"

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
