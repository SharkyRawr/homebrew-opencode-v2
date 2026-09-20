# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.11"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.11/opencode-darwin-x64.zip"
      sha256 "7b774fefdfc0057d62bbab7b9006fe09178637af29f5835d1a3232e6abd98c09"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.11/opencode-darwin-arm64.zip"
      sha256 "8db4b8e75597bbc55b6def870c288e7f61d231616842205dbf14789fec5ef9c1"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.11/opencode-linux-x64.tar.gz"
      sha256 "59e917d7c0704e84f050619973e28374269b1c814548f8c9ae7942f69d69ee13"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.11/opencode-linux-arm64.tar.gz"
      sha256 "73ec223ee914aab93fc8772d27fe2e3eae9ac4ee428fb5d00411e55c5b1477ef"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
