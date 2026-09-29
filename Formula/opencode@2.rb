# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.19"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.19/opencode-darwin-x64.zip"
      sha256 "066053e8874576c1934a569cfe16b6d42ef344fb793e7ff674c75cf29e0835b3"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.19/opencode-darwin-arm64.zip"
      sha256 "42e0bd7c4d16197e29be6b0eb8fa6cc54621792fd9c384a78cf9e607f4027a62"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.19/opencode-linux-x64.tar.gz"
      sha256 "1a9f7184292035a56b6cf22439762930b3a3ed13812f7360c33bb7ae07ef4075"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.19/opencode-linux-arm64.tar.gz"
      sha256 "d0138dd9b43910c28166cfc4da4a53a1b99b07931a37afa749bde812cd02e5a4"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
