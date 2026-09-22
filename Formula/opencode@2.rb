# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.14"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.14/opencode-darwin-x64.zip"
      sha256 "77caf4b9a8547770202439c0b06205b5078eb1939bd6c05a8ea62809026b2892"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.14/opencode-darwin-arm64.zip"
      sha256 "440c0ae923af40518dd34e99315af8c856732094eb4a2137a7a94a6a00f1aa45"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.14/opencode-linux-x64.tar.gz"
      sha256 "1f0be858637fdfa82f49d7e4eb5018b2205c4f26c9bf8294b76d3eef2aed7f7d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.14/opencode-linux-arm64.tar.gz"
      sha256 "c76b4f9490f3d943f0ab9f22707a94082a27ad062abda3da41d8c61ea4b04c04"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
