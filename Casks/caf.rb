cask "caf" do
  version "2.1"
  sha256 "52ab49e1409caad6577f1da0abe1df72b113f5e07c31c22e8fc82167871455be"

  url "https://github.com/b12031106/caf-menu-bar/releases/download/v#{version}/caf-#{version}.dmg"
  name "caf"
  desc "Menu bar app that toggles caffeinate -dims"
  homepage "https://github.com/b12031106/caf-menu-bar"

  app "caf.app"

  # 未簽章 App：安裝後自動移除 quarantine，使用者免手動繞過 Gatekeeper
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/caf.app"]
  end

  zap trash: [
    "~/Library/Saved Application State/local.caf.menubar.savedState",
  ]
end
