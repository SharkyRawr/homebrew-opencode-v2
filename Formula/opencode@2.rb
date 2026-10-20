# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.1.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.1.0/opencode-darwin-x64.zip"
      sha256 "b24001c8c13106852ca8cf47aea125241325052f954845c4f37b6638b484bddc"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.1.0/opencode-darwin-arm64.zip"
      sha256 "76b186b10992e56d7a66cf580006554ca145dba82935b24427764581220bc8fb"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.1.0/opencode-linux-x64.tar.gz"
      sha256 "723ce348959b843ea59617c765f1b58daa8ce325d6e183b436a4138d3048e3f2"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.1.0/opencode-linux-arm64.tar.gz"
      sha256 "ca1b8d3c770dca38f4c302428a47b4a3fccd5b3809259abd55f33e619cc118f4"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
