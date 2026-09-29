# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.20"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.20/opencode-darwin-x64.zip"
      sha256 "89d2fb5081f44ae1cc30406521d0c4638a6ab0c3adf641b155816a5543cfbf41"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.20/opencode-darwin-arm64.zip"
      sha256 "820dd09acc6f7fbe4b73066483fa7036e820c681f3ec33c1fe98fe0d63698265"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.20/opencode-linux-x64.tar.gz"
      sha256 "e991914dbc3b61c4af913c62f8fffec59294176dad0a919161f08d60e7a6aad5"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.20/opencode-linux-arm64.tar.gz"
      sha256 "33ba758e484c82149de8d153305ef0c49539f8fa87e8ead076662e745a89272f"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
