# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.28"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.28/opencode-darwin-x64.zip"
      sha256 "de7013c121d14e01cba40ef48208f28cb25359c300b054656008bf647b2652db"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.28/opencode-darwin-arm64.zip"
      sha256 "0fbb2c8778f7ec45e92cd2f0c90fca47e0255ef501091298dd85d1f93a1a04ef"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.28/opencode-linux-x64.tar.gz"
      sha256 "15cc878cfc7462fe477238538df27ae3fbd03c1ea7631615cacf0977f5b629c6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.28/opencode-linux-arm64.tar.gz"
      sha256 "58fd41544e570ceb9bdb2fa4b445ce66f05538490f6b9ad27d23dcdfe4689670"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
