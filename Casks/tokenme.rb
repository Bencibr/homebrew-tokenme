# Homebrew cask for the TokenMe menu-bar panel. The universal DMG is the
# Intel artifact (one download runs on every Mac); Apple Silicon gets the
# smaller arm64-only image. The app updates itself in place (the panel's
# in-app updater swaps the bundle), hence auto_updates.
cask "tokenme" do
  version "0.1.8"

  on_arm do
    url "https://github.com/Bencibr/tokenme/releases/download/v#{version}/tokenme_#{version}_arm64.dmg"
    sha256 "0d61f3696455086314ef912532c59056bf63c790a4741bb7f9e8a3658e282c5f"
  end
  on_intel do
    url "https://github.com/Bencibr/tokenme/releases/download/v#{version}/tokenme_universal.dmg"
    sha256 "8c12d8a7db2396b3cf38a62f7a89d9b19e4948378d052a8903b339c82f96ccf5"
  end

  name "TokenMe"
  desc "Menu-bar usage and quota panel for AI coding tools"
  homepage "https://github.com/Bencibr/tokenme"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  auto_updates true

  app "TokenMe.app"
end
