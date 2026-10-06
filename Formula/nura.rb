# Homebrew formula for the Nuramem CLI — lives in the tap repo
# `nuramem/homebrew-tap` as `Formula/nura.rb`, so:  brew install nuramem/tap/nura
#
# Points at the standalone binary built by .github/workflows/release.yml (no
# Python toolchain required). The release job (or a manual bump) fills VERSION
# and the two SHA256s from the release's SHA256SUMS.
class Nura < Formula
  desc "Cross-model memory from the terminal (Nuramem CLI)"
  homepage "https://nuramem.ai"
  version "0.3.3"   # bumped per release tag (cli-v<version>)
  license :cannot_represent   # proprietary

  on_macos do
    url "https://github.com/nuramem/cli/releases/download/cli-v#{version}/nura-macos-arm64"
    sha256 "cbac62a682532f31d9a48de1e06ae34c0c96bc8a77c9c71977ca5f3af30a1c4a"
  end

  on_linux do
    url "https://github.com/nuramem/cli/releases/download/cli-v#{version}/nura-linux-x86_64"
    sha256 "3031b7adaca48424ed67eb88e98c30020b3016e61598822420a501a7a1c73c0c"
  end

  def install
    bin.install Dir["nura-*"].first => "nura"
  end

  test do
    assert_match "nura", shell_output("#{bin}/nura --help")
  end
end
