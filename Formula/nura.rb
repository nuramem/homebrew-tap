# Homebrew formula for the Nuramem CLI — lives in the tap repo
# `nuramem/homebrew-tap` as `Formula/nura.rb`, so:  brew install nuramem/tap/nura
#
# Points at the standalone binary built by .github/workflows/release.yml (no
# Python toolchain required). The release job (or a manual bump) fills VERSION
# and the two SHA256s from the release's SHA256SUMS.
class Nura < Formula
  desc "Cross-model memory from the terminal (Nuramem CLI)"
  homepage "https://nuramem.ai"
  version "0.3.2"   # bumped per release tag (cli-v<version>)
  license :cannot_represent   # proprietary

  on_macos do
    url "https://github.com/nuramem/cli/releases/download/cli-v#{version}/nura-macos-arm64"
    sha256 "84032ad4558511abacf476cc6da895dc911f2cece6e70e4ae83a1d2ea01ea0f9"
  end

  on_linux do
    url "https://github.com/nuramem/cli/releases/download/cli-v#{version}/nura-linux-x86_64"
    sha256 "eaac58ee8baf9098aa01574e2af6ea4ab2b73da3205518d3a48cce82bd3f422c"
  end

  def install
    bin.install Dir["nura-*"].first => "nura"
  end

  test do
    assert_match "nura", shell_output("#{bin}/nura --help")
  end
end
