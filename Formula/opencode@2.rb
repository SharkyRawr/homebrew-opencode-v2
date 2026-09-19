# typed: false
# frozen_string_literal: true

class OpencodeAT2 < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/anomalyco/opencode"
  version "2.0.9"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://opencode.ai/files/bin/2.0.9/opencode-darwin-x64.zip"
      sha256 "932926d66a7f0daf94638cc3a0b848395564cde809e099a5048ed12fac568b6e"
    end
    if Hardware::CPU.arm?
      url "https://opencode.ai/files/bin/2.0.9/opencode-darwin-arm64.zip"
      sha256 "d86113dddedb9269b8934b7c454ef18e4cbba37adf896f000c09af5e91ceed60"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.9/opencode-linux-x64.tar.gz"
      sha256 "48bd83fff481d12bf743c9a04a1b64dbc343e8e8634b6e3b2b169bf77765a3e0"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://opencode.ai/files/bin/2.0.9/opencode-linux-arm64.tar.gz"
      sha256 "84e090f359415925ae81736ed129ab5834f2471eccb6596ff14ac032e68152b6"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
