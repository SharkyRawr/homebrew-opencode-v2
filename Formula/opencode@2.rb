# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.2.6"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.2.6/opencode-darwin-x64.zip"
      sha256 "b2962dc445d873df56ae7d3ba7e66502b046bbc4dafa820eca18d0303a98a29c"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.2.6/opencode-darwin-arm64.zip"
      sha256 "15491608f6b0bc4debe5eac35eab629a2b07ea9a1fbac68ad53bcea59fcc4b45"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.2.6/opencode-linux-x64.tar.gz"
      sha256 "08bb21d6326ce740d91cce7ebe88a6536933f6e1e30353b91a06b01f25da306c"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.2.6/opencode-linux-arm64.tar.gz"
      sha256 "f2d27600c367e45057d6a16f6a5c2aa8d77b41a9b10d4bc3d849c2f88870e944"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
