cask "pitwall" do
  version "0.10.0"
  sha256 "2413183756bbee0e9099991976209b9bddcfd4d07c7daf0321ff66a4a2035c8b"

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
