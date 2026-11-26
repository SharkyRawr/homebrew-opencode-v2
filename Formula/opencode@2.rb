# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.4.2"

  bottle do
    root_url "https://github.com/SharkyRawr/homebrew-opencode-v2/releases/download/bottles-2.4.2-45733160202"
    rebuild 1
    sha256                               arm64_golden_gate: "662aeedd8c41380a5ff21b1187ea8b8ecfeb8898a690eb182897c6014ec4d273"
    sha256                               arm64_tahoe:       "f4d85ec66f552bd5157503c4f27edeea002a45c520472b88729bc8646510a8d7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:      "6c2ed8fdee3aa938cb687b9c74997be28ff0b34fd35729ef9816d358ad282e41"
  end

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.4.2/opencode-darwin-x64.zip"
      sha256 "ea4204a75602ce4f1d2121c781a15fa3af6d1c4285cf8b6ae81f61a76deca2a2"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.4.2/opencode-darwin-arm64.zip"
      sha256 "d5a8c9fb4b121ebd531d9369d7ba6ce8af91c9d4d51d6685dbb4e0c7224fa5f3"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.4.2/opencode-linux-x64.tar.gz"
      sha256 "452912288f934d1771bd5bd0d8611ba3a6adc3db3ac3333c37facf373770ba66"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.4.2/opencode-linux-arm64.tar.gz"
      sha256 "bf8d18dde87224629341ff398e76c7c17216b9b406affc728b6c1a5c136abf93"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
