class Ctc < Formula
  desc "CLI tool to count tokens using Claude's Token Counting API"
  homepage "https://github.com/b12031106/claude-token-count-cli"
  version "0.2.0"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/b12031106/claude-token-count-cli/releases/download/v0.2.0/ctc-aarch64-apple-darwin.tar.gz"
      sha256 "bd4a618e02a6bdb43f2b2f90badac6fa48c15088330b9b492db3a9439a8ab938"
    else
      url "https://github.com/b12031106/claude-token-count-cli/releases/download/v0.2.0/ctc-x86_64-apple-darwin.tar.gz"
      sha256 "2b8cf69192980475d730615552bba3cb19e8dd21d51df5daa61f43e40eecef20"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/b12031106/claude-token-count-cli/releases/download/v0.2.0/ctc-aarch64-unknown-linux-musl.tar.gz"
      sha256 "511ecb46238f580c5d90f7ef6d57c90462bf9b033f93490fec82adf0b42e152b"
    else
      url "https://github.com/b12031106/claude-token-count-cli/releases/download/v0.2.0/ctc-x86_64-unknown-linux-musl.tar.gz"
      sha256 "94b8cfcda362a98f2172259fd347987654d5e1023f6c1f9938812633a2c3d433"
    end
  end

  def install
    bin.install "ctc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ctc --version")
  end
end
