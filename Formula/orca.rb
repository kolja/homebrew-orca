class Orca < Formula
  desc "A simple OPDS Server for Calibre written in Rust"
  homepage "https://github.com/kolja/orca"
  license "MIT"

  VERSION = "v0.1.11"

  # to figure out the latest sha sum (over in the kolja/orca repo) run:
  # > cargo make list-sha
  SHA256_DARWIN_ARM = "74d8dc6f4c8427da750bcc04ac735b142a1e18a36947f74c9dc4d7b6a53c6c56"
  SHA256_LINUX_X86 = "5dee4cfbacc87b9ac55ece721f76978633a581eca3b4f8a21be351d1ad022fc1"

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

