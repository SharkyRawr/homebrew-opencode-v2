# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.13"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.13/opencode-darwin-x64.zip"
      sha256 "6636c451e059df0108196323ccedb6852734a1fd751b41ec1f94a5b83d415030"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.13/opencode-darwin-arm64.zip"
      sha256 "558e9a8a5c6edcff3c29db7c96b837764e25d1d11c75c63b53f0b5f033e4d5a5"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.13/opencode-linux-x64.tar.gz"
      sha256 "1d98cc2a8da9850f2bccc9f94f656aab1e7e5a0e61917827336fb064caadbe34"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.13/opencode-linux-arm64.tar.gz"
      sha256 "13852f6a5eacb44c1f15e38b8caa7d735cd00290ab0117177bc5ccfb89e387a5"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
