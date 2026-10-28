# Homebrew cask for the TokenMe menu-bar panel. The universal DMG is the
# Intel artifact (one download runs on every Mac); Apple Silicon gets the
# smaller arm64-only image. The app updates itself in place (the panel's
# in-app updater swaps the bundle), hence auto_updates.
cask "tokenme" do
  version "0.2.0"

  on_arm do
    url "https://github.com/Bencibr/tokenme/releases/download/v#{version}/tokenme_#{version}_arm64.dmg"
    sha256 "ad49aa6ce42f16da80bb6d53117370f89838b00780b545dd7b10938e64f76d7f"
  end
  on_intel do
    url "https://github.com/Bencibr/tokenme/releases/download/v#{version}/tokenme_universal.dmg"
    sha256 "f08ac8b7d25cd6540903d2e6d296e95bde4d223c699f7f0e9ec3751f55bfd8bd"
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
