# Homebrew formula for the Nuramem CLI — lives in the tap repo
# `nuramem/homebrew-tap` as `Formula/nura.rb`, so:  brew install nuramem/tap/nura
#
# Points at the standalone binary built by .github/workflows/release.yml (no
# Python toolchain required). The release job (or a manual bump) fills VERSION
# and the two SHA256s from the release's SHA256SUMS.
class Nura < Formula
  desc "Cross-model memory from the terminal (Nuramem CLI)"
  homepage "https://nuramem.ai"
  version "0.2.1"   # bumped per release tag (cli-v<version>)
  license :cannot_represent   # proprietary

  on_macos do
    url "https://github.com/nuramem/cli/releases/download/cli-v#{version}/nura-macos-arm64"
    sha256 "97ebcd22a9a52f02f1e617f87ab6517ef8214b5861b40d294584c736edd594eb"
  end

  on_linux do
    url "https://github.com/nuramem/cli/releases/download/cli-v#{version}/nura-linux-x86_64"
    sha256 "3d03af891d5860135bb589bdfc678274106c463270e13c02e9c1118e028fed93"
  end

  def install
    bin.install Dir["nura-*"].first => "nura"
  end

  test do
    assert_match "nura", shell_output("#{bin}/nura --help")
  end
end
