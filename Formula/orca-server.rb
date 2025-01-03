class OrcaServer < Formula
  desc "A simple OPDS Server for Calibre written in Rust"
  homepage "https://github.com/kolja/orca"
  license "MIT"

  VERSION = "v0.1.13"

  # to figure out the latest sha sum (over in the kolja/orca repo) run:
  # > cargo make list-sha
SHA256_DARWIN_ARM = "75c8772b072d6b5bb921ca4fc37b9144826bca925afdb0f915fe5e16543a6aea"
SHA256_LINUX_X86 = "ba9375355fe44ef55b75ff1f74028f8e99c7f5639b8ca17a64b8c5eb3a52ddc7"

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

