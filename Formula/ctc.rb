class Ctc < Formula
  desc "CLI tool to count tokens using Claude's Token Counting API"
  homepage "https://github.com/b12031106/claude-token-count-cli"
  version "0.1.0"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/b12031106/claude-token-count-cli/releases/download/v#{version}/ctc-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/b12031106/claude-token-count-cli/releases/download/v#{version}/ctc-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/b12031106/claude-token-count-cli/releases/download/v#{version}/ctc-aarch64-unknown-linux-musl.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/b12031106/claude-token-count-cli/releases/download/v#{version}/ctc-x86_64-unknown-linux-musl.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "ctc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ctc --version")
  end
end
