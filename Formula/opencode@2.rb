# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.2.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.2.0/opencode-darwin-x64.zip"
      sha256 "cc191a1cec9b9cd0192d78dc066bbf48730639131422fa54c87c485a821ba1d5"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.2.0/opencode-darwin-arm64.zip"
      sha256 "c71b1cd96541539ad38e2a75377d2f43d2a27567289a14371a182e9a0800db3d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.2.0/opencode-linux-x64.tar.gz"
      sha256 "6d597970a8cc448f1b9a9f645532584b339dd3ab9583bb5f063f13d83e54768f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.2.0/opencode-linux-arm64.tar.gz"
      sha256 "1f1ce0fc07b9245a815ffa9d652dbb80e6b0f07e5bf74ea87d2b1c0339fbac52"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
