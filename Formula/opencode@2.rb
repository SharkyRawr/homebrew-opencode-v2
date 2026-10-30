# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.2.3"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.2.3/opencode-darwin-x64.zip"
      sha256 "e6b67deeb327ad25eff94bb3c39d8b15466c3de0224e3a0a47a385b69a266d4c"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.2.3/opencode-darwin-arm64.zip"
      sha256 "65db03573e5717e6da245ae3e5c2ffa35915b90689d37c43d4e1ade4d47f55f9"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.2.3/opencode-linux-x64.tar.gz"
      sha256 "ef3aeeaf5522b10d69a3da7bbd6e6d8d259f845833d96b8310767d3407b18a35"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.2.3/opencode-linux-arm64.tar.gz"
      sha256 "72aac82c021268f6cc9810de913f8d47d05626b1ad974d7f5dc5b087e1ad0f68"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
