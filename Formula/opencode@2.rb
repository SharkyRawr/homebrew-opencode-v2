# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.10"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.10/opencode-darwin-x64.zip"
      sha256 "41c83efa6d25b835889698ebbd465c8d5b8597cb5e3568adea53b3a0b43e9e6b"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.10/opencode-darwin-arm64.zip"
      sha256 "e495aa1ecdac43b2974c5cd89d358239ae55a7943c0afa38f97e9f1bdfa3430a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.10/opencode-linux-x64.tar.gz"
      sha256 "14d0fb5823377ad899fe85e69bc01b1564fbef49c8068e6e31b53ff7b31cd09e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.10/opencode-linux-arm64.tar.gz"
      sha256 "75e3b24feadc75300401db4237a7e0f88ec6b7c581ca189cfa87e1b9bec6c007"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
