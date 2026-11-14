cask "pitwall" do
  version "0.11.1"
  sha256 "e36ad7f6a781a09cf03edb9b0337cbd6aaca3f115e3f4ecb3a69e1e791c1a0a8"

  url "https://github.com/JasonHZS/pitwall-collector/releases/download/v#{version}/Pitwall-#{version}.zip"
  name "Pitwall"
  desc "Menu bar for local coding-agent sessions on Apple silicon"
  homepage "https://pitwall.oasislab.dev/"
  auto_updates true

  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "Pitwall.app"
  binary "#{appdir}/Pitwall.app/Contents/Resources/collector/install.sh", target: "pitwall-collector"

  uninstall quit: "io.github.jasonhzs.pitwall"

  # ~/.pitwall is left alone: agent configs still call its hook until `pitwall-collector uninstall`.
  zap trash: [
    "~/Library/Application Support/Pitwall",
    "~/Library/Preferences/io.github.jasonhzs.pitwall.plist",
  ]

  caveats <<~EOS
    Enable event collection for the agents you use (backs up their configs first):
      pitwall-collector install codex claude-code cursor pi devin opencode

    Kimi Code and DeepSeek Harness status are read from local logs and need no install.
    DeepSeek Harness can add an optional local navigation plugin from Pitwall Settings.

    Before uninstalling the app, remove the hooks again:
      pitwall-collector uninstall
  EOS
end
