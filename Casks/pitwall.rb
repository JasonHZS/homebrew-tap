cask "pitwall" do
  version "0.2.0"
  sha256 "f77f55288f1e9e83262672ade4a43a010767e238252e761bcadeb7f4f0d90b56"

  url "https://github.com/JasonHZS/pitwall-collector/releases/download/v#{version}/Pitwall-#{version}.zip"
  name "Pitwall"
  desc "Local dashboard for Codex, Claude Code, Cursor, Pi and Devin sessions"
  homepage "https://pitwall.oasislab.dev"

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
