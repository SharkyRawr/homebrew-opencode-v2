# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.12"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.12/opencode-darwin-x64.zip"
      sha256 "cfe862845204acde80b9ead9bbb4783de4f5ecbbaccd1c4f63a32ee95a1c1712"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.12/opencode-darwin-arm64.zip"
      sha256 "13062b78c4d53f231e93ad6dea7bb1c2751a725fc965990871bee273f98daf48"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.12/opencode-linux-x64.tar.gz"
      sha256 "93efabd6af0fb253fe473c9678b3b959f52a6c132e658226dffacbf52e676122"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.12/opencode-linux-arm64.tar.gz"
      sha256 "5d55080dd02eaa9ecd43314398ce58feaafc5d60906ee07af50cc29e4787b27a"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
