# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.2.5"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.2.5/opencode-darwin-x64.zip"
      sha256 "4d4419022e6ffbd48afc97c5101bdf001d38b0499f516169b9a80a87a340fd56"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.2.5/opencode-darwin-arm64.zip"
      sha256 "25ba9908979fa7d764792c82589b4b5768ab1511154e0317d98aa77d216ce767"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.2.5/opencode-linux-x64.tar.gz"
      sha256 "09f44302c10fd036912f59c81fd1aef5df45dd06f649197f9dfc9bbe2a79614e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.2.5/opencode-linux-arm64.tar.gz"
      sha256 "5a528f42caf576c6cdece6a191eb273d3db54effa5518e0402684d8f8026aeb6"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
