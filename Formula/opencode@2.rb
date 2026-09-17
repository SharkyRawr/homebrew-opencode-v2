# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.6"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.6/opencode-darwin-x64.zip"
      sha256 "b59ea114d518806c05f13c506edf2446c530f6285a054fc9af485816c4a63df7"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.6/opencode-darwin-arm64.zip"
      sha256 "56521518aa7f5ca250d1a36dc7f8674d5506645a9026d48b007697b90216213c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.6/opencode-linux-x64.tar.gz"
      sha256 "833003213e155266c073ae3f19e2a63d027b9d66a8bc9a4610ec9c9d4b369c8d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.6/opencode-linux-arm64.tar.gz"
      sha256 "c074bec6fd05256aaa44525a9986418626e0045994437f30e82b3ece092919d8"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
