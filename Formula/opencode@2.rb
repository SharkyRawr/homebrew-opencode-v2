# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.18"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.18/opencode-darwin-x64.zip"
      sha256 "3a1ecebd359b28ee15ef6042820094a46843ad6ad39172c7ac64936ffce758a3"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.18/opencode-darwin-arm64.zip"
      sha256 "ea3a69433e33ee1fe3e1924de800aa7f28a32e2e1af1812366e88361a46600e2"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.18/opencode-linux-x64.tar.gz"
      sha256 "62257e7b7f22083aede3e4c66b8057cecf0a7038846312b861afc9910e37935e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.18/opencode-linux-arm64.tar.gz"
      sha256 "f46253f0ff5eff0c1751d3b734ede55cc60d932d60af81d061d03745f9998082"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
