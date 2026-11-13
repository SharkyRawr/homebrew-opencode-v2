# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.3.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.3.0/opencode-darwin-x64.zip"
      sha256 "79a4841925e3344d5bb4b000acf6c50b11de301e9047aa9bea9e288e77fe4249"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.3.0/opencode-darwin-arm64.zip"
      sha256 "7907df2b12720a840fbb49c5b978b9b82925b6bf75479a5fd216afa8932b6702"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.3.0/opencode-linux-x64.tar.gz"
      sha256 "fc0f81522aceeabac47693d88389efa2bc517ce74c2c38fd6967819fcc6e4d3b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.3.0/opencode-linux-arm64.tar.gz"
      sha256 "3207fb5cdec448d479242c0f1a14f4f7bdfcad3a79209b5eb8f9003725e93711"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
