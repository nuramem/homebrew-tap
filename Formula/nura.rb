# Homebrew formula for the Nuramem CLI — lives in the tap repo
# `nuramem/homebrew-tap` as `Formula/nura.rb`, so:  brew install nuramem/tap/nura
#
# Points at the standalone binary built by .github/workflows/release.yml (no
# Python toolchain required). The release job (or a manual bump) fills VERSION
# and the two SHA256s from the release's SHA256SUMS.
class Nura < Formula
  desc "Cross-model memory from the terminal (Nuramem CLI)"
  homepage "https://nuramem.ai"
  version "0.2.0"   # bumped per release tag (cli-v<version>)
  license :cannot_represent   # proprietary

  on_macos do
    url "https://github.com/nuramem/cli/releases/download/cli-v#{version}/nura-macos-arm64"
    sha256 "37f327be1ee84c20e9ea3b9d445854372610a55658a3a0d9ca8121065664dde9"
  end

  on_linux do
    url "https://github.com/nuramem/cli/releases/download/cli-v#{version}/nura-linux-x86_64"
    sha256 "a2813d354468bd3a89ece945387e76451eabbe47336e38772a355939cb3feea0"
  end

  def install
    bin.install Dir["nura-*"].first => "nura"
  end

  test do
    assert_match "nura", shell_output("#{bin}/nura --help")
  end
end
