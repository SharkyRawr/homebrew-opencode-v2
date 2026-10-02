# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.22"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.22/opencode-darwin-x64.zip"
      sha256 "bbe286a836de8c27ded4e147c88a32c709997753a1fbd4e78daea2edc8a9f4b5"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.22/opencode-darwin-arm64.zip"
      sha256 "b152ebd6ae63790e1f4751494d9db35266e7d06118e3a79afb4f65d549441db6"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.22/opencode-linux-x64.tar.gz"
      sha256 "91abc832b36f619ae2e4c21a33c9887bbc861e95c1492003ab7970e9484d1ef1"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.22/opencode-linux-arm64.tar.gz"
      sha256 "3f4df7efe28a53830777666e160984cf8247938e68f105b8ae1f9b4778febc2d"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
