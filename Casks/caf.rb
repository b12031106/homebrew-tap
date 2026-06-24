cask "caf" do
  version "2.0"
  sha256 "7d438f6413720d767ec0c4ad5b28d5faa1eb936c961cd5873d5fc63dab93c0d9"

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
