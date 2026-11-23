# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.4.0"

  bottle do
    root_url "https://github.com/SharkyRawr/homebrew-opencode-v2/releases/download/bottles-2.4.0-45176338143"
    rebuild 1
    sha256                               arm64_golden_gate: "ec3722e9be670e8e3cb07aeb251713064f679c3ede138a1cfd351984bbe89728"
    sha256                               arm64_tahoe:       "5fbc16edf9e29519fb1873e3667a5b03526a8b0e402400215114623042d8b37e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:      "d22d447d8bb69fbe06755bc9ef5234259a6fe0e2fee1338e89ea55df1cc73638"
  end

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.4.0/opencode-darwin-x64.zip"
      sha256 "6ea2220862e3e55918271c98bda1fa163e7df8dc9dfcc8bc6be360bc042ae148"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.4.0/opencode-darwin-arm64.zip"
      sha256 "aa3d5929140008fd5ed88e5cd0f35c624b0f25c8679c196fc99c277415bc80ad"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.4.0/opencode-linux-x64.tar.gz"
      sha256 "66cf6adeb02fbfe9ccbb1f6497fcf46cecf2d299a1dc3a7a32e01ea30ff20201"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.4.0/opencode-linux-arm64.tar.gz"
      sha256 "fed468566215fd38b26abab99018240c0d30772d3f45aee25621664ceff7e360"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
