cask "pitwall" do
  version "0.4.1"
  sha256 "e1e6f9e881654050581a0c7aa9e8a1e7d6f790253ca611875b82ad13f206a308"

  url "https://github.com/JasonHZS/pitwall-collector/releases/download/v#{version}/Pitwall-#{version}.zip"
  name "Pitwall"
  desc "Local dashboard for Codex, Claude Code, Cursor, Pi and Devin sessions"
  homepage "https://pitwall.oasislab.dev/"
  auto_updates true

  depends_on macos: :sequoia

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
      pitwall-collector install codex claude-code cursor pi devin

    Before uninstalling the app, remove the hooks again:
      pitwall-collector uninstall
  EOS
end
