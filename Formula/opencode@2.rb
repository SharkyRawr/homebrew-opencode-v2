# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.1.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.1.2/opencode-darwin-x64.zip"
      sha256 "e21cacc8789e517ef4a10fcf3378abbcb24ba8ad664a1475b10b45897c3f9227"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.1.2/opencode-darwin-arm64.zip"
      sha256 "1051221bbce68e541f432be07d58beb66c1827dae9e04417a49f56115e0e0d4c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.1.2/opencode-linux-x64.tar.gz"
      sha256 "f752172139f82d33470955f68bbd00c244de81b079f51ea54a1b68d170c394c8"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.1.2/opencode-linux-arm64.tar.gz"
      sha256 "3ddeab155dd75f36d9fd4f5db80e2392181a4b9f59e347a0361a127244686e94"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
