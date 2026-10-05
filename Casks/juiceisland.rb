cask "juiceisland" do
  version "0.5.0"
  sha256 "10fb16bd26dfacf882c4679277d858e6cf96355fe607af1b121c466b8553ec6f"

  url "https://github.com/michaelofengenden/juiceisland/releases/download/v#{version}/Juice-#{version}.dmg"
  name "Juice"
  desc "Notch island for coding agents: approvals, sessions and usage limits"
  homepage "https://github.com/michaelofengenden/juiceisland"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :tahoe"

  app "Juice.app"

  uninstall quit: "io.github.michaelofengenden.juice"

  zap trash: [
    "~/Library/Application Support/io.github.michaelofengenden.juice",
    "~/Library/Caches/io.github.michaelofengenden.juice",
    "~/Library/Containers/io.github.michaelofengenden.juice.widget",
    "~/Library/Group Containers/KBD9RS8425.io.github.michaelofengenden.juice",
    "~/Library/HTTPStorages/io.github.michaelofengenden.juice",
    "~/Library/Logs/io.github.michaelofengenden.juice",
    "~/Library/Preferences/io.github.michaelofengenden.juice.plist",
    "~/Library/Saved Application State/io.github.michaelofengenden.juice.savedState",
  ]

  caveats <<~EOS
    Before you uninstall, click Remove from all agents in Juice's Settings > Agents,
    so no agent keeps calling Juice's hook helper.
  EOS
end
