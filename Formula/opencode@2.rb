# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.24"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.24/opencode-darwin-x64.zip"
      sha256 "b9ec13b83c41fe6e6f8a3c767727db1c35d6fdd4f9485a0d64ab6166db056fd6"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.24/opencode-darwin-arm64.zip"
      sha256 "64036a08d34959638a67e09137add101259abb4c8f50d2bf75bc7112ff8c8042"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.24/opencode-linux-x64.tar.gz"
      sha256 "8f266b3043f96d6077fc0459bdde72e4199bf88c27e6af573047df8ae3853345"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.24/opencode-linux-arm64.tar.gz"
      sha256 "235655c7af6964acfcc4ef57f4165213104770d0cad263495d426a7261978370"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
