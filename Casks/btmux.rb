cask "btmux" do
  version "0.0.215"
  sha256 "bbf8500eab53481f79b82b47c424a7a20ac5ce1b7d67801a2c88ca63669eaa14"

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
