# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.2.7"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.2.7/opencode-darwin-x64.zip"
      sha256 "3e4ea96ece041218cc74bc7c7d5cd202ff1f7983e32fc7ab6c58d532445e7961"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.2.7/opencode-darwin-arm64.zip"
      sha256 "811c42be9cad489ea8c411ead49e06f691deee4957ba9a0a56a159a7d6c1abdc"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.2.7/opencode-linux-x64.tar.gz"
      sha256 "89a6cee227b54bc011179c528a5e63176032462b1a5e21723b616801cddc2ca7"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.2.7/opencode-linux-arm64.tar.gz"
      sha256 "c1682057f0815cb2abdd6e00305f1146ebaf1c167f0335cdb74ddc80008120e7"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
