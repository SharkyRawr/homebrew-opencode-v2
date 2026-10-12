# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.27"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.27/opencode-darwin-x64.zip"
      sha256 "b93395b257dd2a97c2b3687111b3d50186db387e4f598e81a2eb330be69ce2e2"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.27/opencode-darwin-arm64.zip"
      sha256 "391b1061dc3f1f4394b7fd19513b2e6ff12f31739ee12f33880506ed6ee008bc"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.27/opencode-linux-x64.tar.gz"
      sha256 "943772cff30319b814c49fe84058f1121b74b6cbb5d27b3824bec62f2adecb9a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.27/opencode-linux-arm64.tar.gz"
      sha256 "28db459fa99c3582b968e39ceccc44254c152492056d40cd2bc548669d68aab7"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
