# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.29"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.29/opencode-darwin-x64.zip"
      sha256 "678400c2acc2c4f14aa261840fa2a35f907fbfc6d5edb102441b0275fd8cc605"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.29/opencode-darwin-arm64.zip"
      sha256 "cde9292948a79f910384b246ebec90dce02654158ad63cec61ed912aabc7f601"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.29/opencode-linux-x64.tar.gz"
      sha256 "17d0a4219178f982a08fdc3d19e9252edf815b23f2f26e3e77b800b43c853598"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.29/opencode-linux-arm64.tar.gz"
      sha256 "39d0aa787531b0be9e67d087e8ff665cda1f8e748124fe790fe35f1fdd005c38"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
