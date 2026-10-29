# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.2.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.2.2/opencode-darwin-x64.zip"
      sha256 "898677aa3c686326a37eda1e5875a45c6d1510717ac663236aa200e913b13cff"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.2.2/opencode-darwin-arm64.zip"
      sha256 "c1c901a6379d667b7a30a3eea5a8f6e93416dba43e889e834771f6fb174f35c9"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.2.2/opencode-linux-x64.tar.gz"
      sha256 "3a38b8c284450a5ca81a2c1ebbf29ebe05e618518f095da0066652167eb0eb33"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.2.2/opencode-linux-arm64.tar.gz"
      sha256 "dd866cebb72d11c91a7a7c4c3fd961ee06e03a9d0a5ff8eaa2a8ebebf25de7ba"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
