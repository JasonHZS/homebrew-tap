cask "pitwall" do
  version "0.7.1"
  sha256 "b99cb26becafa8fa64507de2f81df7edc842949b0da2a7bf537e7fd16c3c23de"

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
