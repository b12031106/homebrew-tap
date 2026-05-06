class Ctc < Formula
  desc "CLI tool to count tokens using Claude's Token Counting API"
  homepage "https://github.com/b12031106/claude-token-count-cli"
  version "0.1.0"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/b12031106/claude-token-count-cli/releases/download/v0.1.0/ctc-aarch64-apple-darwin.tar.gz"
      sha256 "f44f53d9611ecceadb9b9172458201f2a8b7bc520bf40defb4aac51f991bfe6b"
    else
      url "https://github.com/b12031106/claude-token-count-cli/releases/download/v0.1.0/ctc-x86_64-apple-darwin.tar.gz"
      sha256 "b919f50b1c8fadee5ff6c920c56972f75c8f18e8777d922f418282575863a0be"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/b12031106/claude-token-count-cli/releases/download/v0.1.0/ctc-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cfdba0a14777889b46292d3f8f521b1b3e26f962a3fe1ef91aadb6eff6199d86"
    else
      url "https://github.com/b12031106/claude-token-count-cli/releases/download/v0.1.0/ctc-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8f6dcc2be50abfcca4c2c611c11c634d9747be3b4d381f87e2580905e238b19a"
    end
  end

  def install
    bin.install "ctc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ctc --version")
  end
end
