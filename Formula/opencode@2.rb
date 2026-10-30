# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.2.4"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.2.4/opencode-darwin-x64.zip"
      sha256 "2be9b7671f94a9636b85ff31fcfce613f197c5204ec90291982d692010d072fd"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.2.4/opencode-darwin-arm64.zip"
      sha256 "4e093cae2931773c354896d98e7da0cfa3607c110aeaf255ba07f9c2d2238219"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.2.4/opencode-linux-x64.tar.gz"
      sha256 "1b70ce4a88e27c3643c2bb61c757dfe173b4e3629926ce808d45f3774d87826e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.2.4/opencode-linux-arm64.tar.gz"
      sha256 "81edcae078f36356cde3cf57d0cc6627896b18d1bddf47317cb025c56fcffd93"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
