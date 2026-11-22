# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.3.2"

  bottle do
    root_url "https://github.com/SharkyRawr/homebrew-opencode-v2/releases/download/bottles-2.3.2-44986685417"
    rebuild 1
    sha256                               arm64_golden_gate: "5ffca8de1a54003e21d616898a2135ec735b42cb4495304cd7b1cd4b7acce2f1"
    sha256                               arm64_tahoe:       "19a4bff24a8f6111dd98dd549a7230990dfe0240f9cb5f224e1adc2d7d96a244"
    sha256 cellar: :any_skip_relocation, x86_64_linux:      "aabdb629fe3dd0fe14c8a3822a75979b70003d30af2c81d4eb73a470b94c7bf4"
  end

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
