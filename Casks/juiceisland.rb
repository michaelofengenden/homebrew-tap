cask "juiceisland" do
  version "0.8.1"
  sha256 "366e8f770bc31cc269005d81bb3db97d9cb652548c7afb9bf889f9207f3e4d03"

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
