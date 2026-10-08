# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.26"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.26/opencode-darwin-x64.zip"
      sha256 "6cd9a9aaf992571cd91baa8e3e5cf7393a8bd483fc28858eac68b2838ae812a7"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.26/opencode-darwin-arm64.zip"
      sha256 "325fa77c1e0f46e40a8297c168355501965230bd1f32923f367ec1b5ee19fac3"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.26/opencode-linux-x64.tar.gz"
      sha256 "6d94dde0ac1b009327189772f5e242e13f7f7916a4fcd58bf39f9c15d6a517d1"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.26/opencode-linux-arm64.tar.gz"
      sha256 "1508f9cc9a519b2aac93439d171a0be554ffe5a2cf433405010ec664663a7eae"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
