# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.15"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.15/opencode-darwin-x64.zip"
      sha256 "a60aea5268ddd56980dc927f06b1b53f6e0d6916e9fffeda44095a2978b3da72"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.15/opencode-darwin-arm64.zip"
      sha256 "4090acfb5a854d8c1c59250b62da8aad9c17872c793e0033c0a55adc3f4739da"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.15/opencode-linux-x64.tar.gz"
      sha256 "115b4659141507c5a0942ac23a821e25fadc8397cb4b2770e34072a91222830e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.15/opencode-linux-arm64.tar.gz"
      sha256 "731b8e3f5b330336b0999e49978ba2340ba7645af33f4ce90027d95d25fa9b27"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
