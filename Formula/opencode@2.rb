# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.32"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.32/opencode-darwin-x64.zip"
      sha256 "1b2d6d58741db617d02ab2cd589de8bc5c829d8b0093226e813a10d044f4ede9"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.32/opencode-darwin-arm64.zip"
      sha256 "e431e369025ba9554445d0ea8ad65457fbca59aa385ca790724ec6ab488d271b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.32/opencode-linux-x64.tar.gz"
      sha256 "ba3f5d9dd983f12f06981b5b9eb966c03db63266afab28adc4000bbad6adc33c"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.32/opencode-linux-arm64.tar.gz"
      sha256 "c2e4f6c94f2e58a2df99cc647bd37285569600d7435e3796152825d8c9d10382"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
