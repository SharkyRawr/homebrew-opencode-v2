# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.7"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.7/opencode-darwin-x64.zip"
      sha256 "e9b0b8da42a5c03601254dbd5df6dac439e75f88c73d9ac8a94d4c05022e39df"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.7/opencode-darwin-arm64.zip"
      sha256 "dc96ded606b079da10773d67a36fbb8b1a377e6430db33b884ba82b42501c685"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.7/opencode-linux-x64.tar.gz"
      sha256 "2e4a0fbbd1e5a23702bbd4205f22f80d1ca685d8d2d786dcecf42f7ea476330c"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.7/opencode-linux-arm64.tar.gz"
      sha256 "7374432b23659a890907c5333ef6b179d5ffe8e4b13726875040dd7ea20df6c7"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
