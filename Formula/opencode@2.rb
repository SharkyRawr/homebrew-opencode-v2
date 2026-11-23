# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.4.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.4.1/opencode-darwin-x64.zip"
      sha256 "a7a4c758a32488138531ab2d82be86e2a1438c35c017664f83daa1d5b63bb82c"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.4.1/opencode-darwin-arm64.zip"
      sha256 "95a101eda95108478f1db43cff8fcbd4811f6c0e79af1e167301843c6a48d731"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.4.1/opencode-linux-x64.tar.gz"
      sha256 "9ddd18e3faf64eaeccf6a0fcbc96a5c7a14520ae5fd5b61e5be51d894f478b47"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.4.1/opencode-linux-arm64.tar.gz"
      sha256 "cb28cf94541aeb62a4b2ea5997a99b5dd6bae595a772f36fbe279299f2032a4f"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
