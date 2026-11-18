# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.3.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.3.2/opencode-darwin-x64.zip"
      sha256 "1875a6d1106702f04c9468831563c061bd00337f891a1b4a6cd151155e6aaf5c"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.3.2/opencode-darwin-arm64.zip"
      sha256 "31ab5a06a29edc7e49b895f35c2b64ebfe7c7f0437b0f2581b006efcd79fee1a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.3.2/opencode-linux-x64.tar.gz"
      sha256 "563b5d663637226b6e3bb4bb6803281bc39b0d2cd88db06d674b6420aab009b0"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.3.2/opencode-linux-arm64.tar.gz"
      sha256 "9d10185acdb72336e086e699ca363a6065f410fd3c1caed0dc8046e95ac06ccb"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
