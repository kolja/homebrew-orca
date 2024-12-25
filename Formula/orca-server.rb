class OrcaServer < Formula
  desc "A simple OPDS Server for Calibre written in Rust"
  homepage "https://github.com/kolja/orca"
  license "MIT"

  VERSION = "v0.1.12"

  # to figure out the latest sha sum (over in the kolja/orca repo) run:
  # > cargo make list-sha
  SHA256_DARWIN_ARM = "38d16703d1575feedf2386ac370c68be83735fa52408842e838564192c74dcf3"
  SHA256_LINUX_X86 = "0b78a745d7ce843592f2c9ff9406b904efdd8d05f2ef7db20fe16fa80bda42df"

  BASE_URL = "https://github.com/kolja/orca/releases/download"

  version VERSION

  if OS.mac?
    url "#{BASE_URL}/#{VERSION}/orca-aarch64-apple-darwin.tar.gz"
    sha256 SHA256_DARWIN_ARM
  elsif OS.linux?
    url "#{BASE_URL}/#{VERSION}/orca-x86_64-unknown-linux-musl.tar.gz"
    sha256 SHA256_LINUX_X86
  end

  def install
    bin.install "orca"
  end

  test do
    system "#{bin}/orca", "--version"
  end
end

