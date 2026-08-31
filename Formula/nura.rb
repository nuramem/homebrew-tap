# Homebrew formula for the Nuramem CLI — lives in the tap repo
# `nuramem/homebrew-tap` as `Formula/nura.rb`, so:  brew install nuramem/tap/nura
#
# Points at the standalone binary built by .github/workflows/release.yml (no
# Python toolchain required). The release job (or a manual bump) fills VERSION
# and the two SHA256s from the release's SHA256SUMS.
class Nura < Formula
  desc "Cross-model memory from the terminal (Nuramem CLI)"
  homepage "https://nuramem.ai"
  version "0.2.2"   # bumped per release tag (cli-v<version>)
  license :cannot_represent   # proprietary

  on_macos do
    url "https://github.com/nuramem/cli/releases/download/cli-v#{version}/nura-macos-arm64"
    sha256 "371de79dea2d4b47e6a19b17461c38e38ed025e035c9a69158defda00e50d9c1"
  end

  on_linux do
    url "https://github.com/nuramem/cli/releases/download/cli-v#{version}/nura-linux-x86_64"
    sha256 "7fe2bbc24035057b6deef5463996d9bdf0e1554f25a16d54970d69fa54efcbc7"
  end

  def install
    bin.install Dir["nura-*"].first => "nura"
  end

  test do
    assert_match "nura", shell_output("#{bin}/nura --help")
  end
end
