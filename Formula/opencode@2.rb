# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.1.3"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.1.3/opencode-darwin-x64.zip"
      sha256 "34c91aa1695c5793ed49f40157912796401d11dde545a6e114d8215cf07457be"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.1.3/opencode-darwin-arm64.zip"
      sha256 "a6b0ec57814f751a4ea2b23d19bc9cd98283203b032d975ce9c429aa99d360ab"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.1.3/opencode-linux-x64.tar.gz"
      sha256 "f1561a5fa724b781d97e9bf86eb6aceb82b56ef91fa19c03a2cd7b24c36028ab"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.1.3/opencode-linux-arm64.tar.gz"
      sha256 "44b568374e7da234f008b1eb0d8f6001d93a4b34b8219f3aaef058d4499c7439"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
