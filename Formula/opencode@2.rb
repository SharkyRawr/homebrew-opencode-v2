# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.3.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.3.1/opencode-darwin-x64.zip"
      sha256 "12a294c5c094ec856dea77eae08866279d3920700737d26564ca046f3c44b8d2"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.3.1/opencode-darwin-arm64.zip"
      sha256 "7c98869cb57bbc76ad4fa732b591fd61adabeb7a4ab7b9ef9aa91489d356147c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.3.1/opencode-linux-x64.tar.gz"
      sha256 "2f9ac6811d45831f80741b75e94fbe121fd3fa8ba7ecde3381814ed7410f1820"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.3.1/opencode-linux-arm64.tar.gz"
      sha256 "7be3d4efa0844badd66f1f76d8a7597edeb3c26adfed89393b6ddac31dcde358"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
