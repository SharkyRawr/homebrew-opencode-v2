# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.2.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.2.1/opencode-darwin-x64.zip"
      sha256 "d1cfb2315cbca0fe20876a76f2efc63c945a002290b05ab01dadec33b67a7f98"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.2.1/opencode-darwin-arm64.zip"
      sha256 "9df6ca3d031565c61080c717374ba846d238ec5b1c411eebe6b1b85835998ffe"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.2.1/opencode-linux-x64.tar.gz"
      sha256 "3179551ddf69877ca24a960b0175e94405cf3f52147f1eec705094374bef49f2"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.2.1/opencode-linux-arm64.tar.gz"
      sha256 "c354d8a2dc4152308bf286b5ec7f20b3b3cfc71f9476e64f6aa274142505b2f8"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
