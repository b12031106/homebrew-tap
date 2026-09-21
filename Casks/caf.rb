cask "caf" do
  version "2.3"
  sha256 "2208aea166b989de364fd4e39014d2ef3bc64594f6e6ae09435cda92fc4c6afc"

  url "https://github.com/b12031106/caf-menu-bar/releases/download/v#{version}/caf-#{version}.dmg"
  name "caf"
  desc "Menu bar app that prevents sleep with caffeinate or pmset"
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
