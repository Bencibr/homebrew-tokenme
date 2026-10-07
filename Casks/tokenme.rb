# Homebrew cask for the TokenMe menu-bar panel. The universal DMG is the
# Intel artifact (one download runs on every Mac); Apple Silicon gets the
# smaller arm64-only image. The app updates itself in place (the panel's
# in-app updater swaps the bundle), hence auto_updates.
cask "tokenme" do
  version "0.1.5"

  on_arm do
    url "https://github.com/Bencibr/tokenme/releases/download/v#{version}/tokenme_#{version}_arm64.dmg"
    sha256 "081788924678038f1ad16108d304d0b6674d3888bb32067aae38ca5475a37d99"
  end
  on_intel do
    url "https://github.com/Bencibr/tokenme/releases/download/v#{version}/tokenme_universal.dmg"
    sha256 "13e8613768ec7bc268e033a6f41fde1f36f253a9d2af7f7f8b2d741e157464b3"
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
