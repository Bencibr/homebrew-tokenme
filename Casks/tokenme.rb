# Homebrew cask for the TokenMe menu-bar panel. The universal DMG is the
# Intel artifact (one download runs on every Mac); Apple Silicon gets the
# smaller arm64-only image. The app updates itself in place (the panel's
# in-app updater swaps the bundle), hence auto_updates.
cask "tokenme" do
  version "0.1.9"

  on_arm do
    url "https://github.com/Bencibr/tokenme/releases/download/v#{version}/tokenme_#{version}_arm64.dmg"
    sha256 "c9204bd9c3f074efe35f0daae85ec55a7b78516a562c4d8aa36f782142b2cebc"
  end
  on_intel do
    url "https://github.com/Bencibr/tokenme/releases/download/v#{version}/tokenme_universal.dmg"
    sha256 "e5da6315fa7eeb7ecbe6928221b4b44c5d090842babe57e83f9db47c2bfe9152"
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
