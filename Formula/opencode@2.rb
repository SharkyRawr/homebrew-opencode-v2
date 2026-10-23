# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.1.4"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.1.4/opencode-darwin-x64.zip"
      sha256 "7f35265b6900ce75b01e03cab2497622026b402c021ecf6e6e68755874245a6b"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.1.4/opencode-darwin-arm64.zip"
      sha256 "f9edc1dded080e39aa61db94270a51af66772ac572be7d6b15fa6f87251a3dff"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.1.4/opencode-linux-x64.tar.gz"
      sha256 "2edaf8cf96e81dec5ee996a3196b03345cf59e5a1673d83a4599bb4afc5c5f6d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.1.4/opencode-linux-arm64.tar.gz"
      sha256 "759c9d6e7b246b81bcc93dfc6cc3bb2a38287c75b6202e305eacacb5dd882315"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
