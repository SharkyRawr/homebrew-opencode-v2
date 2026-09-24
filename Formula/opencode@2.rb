# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.16"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.16/opencode-darwin-x64.zip"
      sha256 "d88ddbff7998ce02a6a96f043e81055867707c7e1f7d6e5d72a786c8af77582e"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.16/opencode-darwin-arm64.zip"
      sha256 "15591ea3b9920e018d2d8016067c69b71e1756c869586c7eae87eb110d952bd5"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.16/opencode-linux-x64.tar.gz"
      sha256 "2b9cda33a7a5387ebc5d37da478ba7cb90524a769741afda4c44ce6cd2c28163"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.16/opencode-linux-arm64.tar.gz"
      sha256 "4d59f709fb867ac04b23b8a6398d3a7dd05e796994aefe07cb995071865eb4a6"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
