# Homebrew formula for the tokenme CLI (cask tokenme is the panel; this is the CLI).: installs the prebuilt binary from the
# GitHub release — no compile step, the workspace's debug/test targets never
# touch the end user. The menu-bar panel is the tokenme cask.
class TokenmeCli < Formula
  desc "Cross-tool AI token usage and cost from the tools' own logs"
  homepage "https://github.com/Bencibr/tokenme"
  version "0.1.8"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  # macOS-only on purpose: the releases carry Apple and Windows binaries, and
  # a formula that compiles would force a Rust toolchain onto every user.
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Bencibr/tokenme/releases/download/v#{version}/tokenme-cli-aarch64-apple-darwin.tar.gz"
      sha256 "8e87e2fb279683d3e1e21b4b0bd6425865f6a0336044e11159215461c94e3ac1"
    else
      url "https://github.com/Bencibr/tokenme/releases/download/v#{version}/tokenme-cli-x86_64-apple-darwin.tar.gz"
      sha256 "6aead7e76c04432e8be4a074e5bafcd1b3716116b5ce1fb5aeff5e7669610eb2"
    end
  end

  def install
    bin.install "tokenme"
  end

  def caveats
    <<~EOS
      The menu-bar panel (quota gauges, usage pages) ships as a cask:
        brew install --cask Bencibr/tokenme/tokenme
    EOS
  end

  test do
    # The CLI stamps its own Cargo version, which trailed the panel's until the
    # workspace alignment; match the shape, not this release's literal.
    assert_match %r{tokenme \d+\.\d+\.\d+}, shell_output("#{bin}/tokenme --version")
  end
end
