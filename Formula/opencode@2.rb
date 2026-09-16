# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.5"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.5/opencode-darwin-x64.zip"
      sha256 "54cca70d02829b609c7268d074756a85851bdd175fe4cfac0a2d1d3e3c06ab5a"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.5/opencode-darwin-arm64.zip"
      sha256 "a98bac02bfe8307cdf5aaec473072c0f5f9907bd8f7d3789dec20fea2d57f7c9"
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.5/opencode-linux-x64.tar.gz"
      sha256 "c2f816efa42daebbc79e28af571da1f424f12b952237241a7aa81d5cb27b7d9f"
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.5/opencode-linux-arm64.tar.gz"
      sha256 "ed615a7d5ce567d73872b21bc44dddcf0540560c26666f16af17324c9e0857a9"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
