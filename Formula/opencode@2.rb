# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.1.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.1.1/opencode-darwin-x64.zip"
      sha256 "0e28bd76128f0e8f0a94fcf513d8710a93e7da3d15d53955eb467c834786533e"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.1.1/opencode-darwin-arm64.zip"
      sha256 "a8b4ab1e95f2b3928cdaec781bac14bb4bd1b1619a41b0d55e6f185490488551"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.1.1/opencode-linux-x64.tar.gz"
      sha256 "b7070ffb7c255b9633f69dee8b068f4f3ac35bdc33d44841dde67deb88ff4853"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.1.1/opencode-linux-arm64.tar.gz"
      sha256 "7f387077e0ba7d26964d19b9b31fac784ec4edb759f2b5fe34878aeb4b0545b1"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
