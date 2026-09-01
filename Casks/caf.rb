cask "caf" do
  version "2.2"
  sha256 "7af8eec56ab46d0e93c5a8e53d95a6eff117a24d19cb2e20f99b6a3219c59d52"

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
