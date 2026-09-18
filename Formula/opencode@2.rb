# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.8"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.8/opencode-darwin-x64.zip"
      sha256 "82b7ec8fdc2fc2174f942b9968063dce4357f7ce863823146867e2f55875d91a"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.8/opencode-darwin-arm64.zip"
      sha256 "43699eca8ca0752eafa5d0fbd55f48a2d60df534619bb410b7b7692ac0ef9299"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.8/opencode-linux-x64.tar.gz"
      sha256 "b9bfbb9afd1148341c594d88fd2ebef257eb5801a9cea06a39e034c2417fb34f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.8/opencode-linux-arm64.tar.gz"
      sha256 "6674454f5250d5784e7a0c61c2838c550e362b119a9207eaa167fe59a4de947c"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
