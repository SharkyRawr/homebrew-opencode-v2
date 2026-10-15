# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.30"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.30/opencode-darwin-x64.zip"
      sha256 "9e3b1ab51578a1f555fa5f6adee534a4986c9036013d5d0da4351eb939c4e08e"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.30/opencode-darwin-arm64.zip"
      sha256 "1d5cb2a30272f070c9c55b6d8895bda1d1929e7702f5e6beb02b5d3a17de8961"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.30/opencode-linux-x64.tar.gz"
      sha256 "eca96167a12d982189d4f8d35952bf26d135a13751748db64fe17b72d5259793"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.30/opencode-linux-arm64.tar.gz"
      sha256 "5211e95cb617eb04e1a5a0fa32e2e0d11a248b3bc7ed105d84cad761cc66ab7b"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
