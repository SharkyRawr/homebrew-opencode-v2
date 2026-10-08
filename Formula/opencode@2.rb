# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.25"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.25/opencode-darwin-x64.zip"
      sha256 "f03f02360875de96e6d42f458b9ae9cedc04e0d244bb25ff23fb2b703c810ff5"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.25/opencode-darwin-arm64.zip"
      sha256 "7280822bfb05ce8dce2b3d0584b2945f51c7623d93fc7aa0bcf875d35895d222"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.25/opencode-linux-x64.tar.gz"
      sha256 "bbdb7eb66d42e57f64c3591e3dc998be8cde32e7f663a8bfb0ecd1612c31a13a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.25/opencode-linux-arm64.tar.gz"
      sha256 "5ac0cb04b8025ea8cd31c4c0b401eb7ee90786c16df09721241a48d95bb4dd02"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
