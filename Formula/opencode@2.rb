# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.21"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.21/opencode-darwin-x64.zip"
      sha256 "6790e125af2b31c25e7bac8f42e527d37e4519c802bbf2767f764146acc5a16d"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.21/opencode-darwin-arm64.zip"
      sha256 "41caebd166aa1a72bb85c2e9a3ca81c6ff3170af1cbef8b7b07f92f19adb6840"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.21/opencode-linux-x64.tar.gz"
      sha256 "d613a5d534e50d744f983672fa006e6f12179feb43a0ba14589d796cdc93983b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.21/opencode-linux-arm64.tar.gz"
      sha256 "16c354810ef5844da2971b7dd103ccd18677bc1489755f788ac09cab72b0824d"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
