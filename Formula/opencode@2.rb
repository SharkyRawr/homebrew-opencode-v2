# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.17"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.17/opencode-darwin-x64.zip"
      sha256 "395f179b9e6597e75cefddb36f67aebd14a1bcdff7d00797df0fedd358ca1c3b"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.17/opencode-darwin-arm64.zip"
      sha256 "7a04339ea0ca2fd03b3cdd02eb0372937aedeb2520784dfd68369cd84faf4240"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.17/opencode-linux-x64.tar.gz"
      sha256 "52fb94d69695ea3b262e547795d9257fd332a5364752f4a305d3def650d93e99"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.17/opencode-linux-arm64.tar.gz"
      sha256 "7d69cbf6812f9f45bea512660808408c447aa3936e0c8be765a2b200ea64ac79"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
