# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.31"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.31/opencode-darwin-x64.zip"
      sha256 "012986620cf5a17191abb11a2b299e56df99ce34b6a6730914eb2ea2eacc9a32"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.31/opencode-darwin-arm64.zip"
      sha256 "08883440ab20e663f1e33a69045bb3286643b6a309855139673615fa704cc71a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.31/opencode-linux-x64.tar.gz"
      sha256 "0b912c37856eb268419b0e64db7625dd940a08a0285d5041e7e192cc81bdf230"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.31/opencode-linux-arm64.tar.gz"
      sha256 "861623e0d158e9e2d284a52dfb42af6153c312a94edd6128c8cd7a59c955729a"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
