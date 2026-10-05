# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.23"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.23/opencode-darwin-x64.zip"
      sha256 "85315edb638d65c8c4f8c4095d1fa71ccb2ead6432269a1bd9ed75e7399e9584"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.23/opencode-darwin-arm64.zip"
      sha256 "c8d545c80abcad9a7409b564bed546a821823d282a43573ecabf7a6763984591"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.23/opencode-linux-x64.tar.gz"
      sha256 "13d1d45fc1d205dbfc8bc99a07b59f30d1e192375b75131620ef30cc7edd0f7f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.23/opencode-linux-arm64.tar.gz"
      sha256 "6c1fa35b43edd1a2daf54e59a4b35faf9f28fedbb742ed18c516954bac91c0f0"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
