# typed: false
# frozen_string_literal: true
# Auto-updated by the Truzt release pipeline. DO NOT EDIT.
class Truzt < Formula
  desc "Truzt — secure mesh network client."
  homepage "https://truzt.lk/"
  version "2.9.3"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.intel?
      url "https://pkgs.truzt.lk/release/v2.9.3/truzt_2.9.3_darwin_amd64.tar.gz"
      sha256 "339d0aadb7171100d22ef7eceaad1a848f306dfad87d682ee400047b88750865"
      define_method(:install) { bin.install "truzt" }
    end
    if Hardware::CPU.arm?
      url "https://pkgs.truzt.lk/release/v2.9.3/truzt_2.9.3_darwin_arm64.tar.gz"
      sha256 "9647c876d4028347b272dbaacf36d66c6ae0590fb0461228491cfac5fe9e7558"
      define_method(:install) { bin.install "truzt" }
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://pkgs.truzt.lk/release/v2.9.3/truzt_2.9.3_linux_amd64.tar.gz"
      sha256 "22a0b384d7b3bf5538c9f58f808276cb7b7f540f33957f1ab8b992dafebefc60"
      define_method(:install) { bin.install "truzt" }
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://pkgs.truzt.lk/release/v2.9.3/truzt_2.9.3_linux_arm64.tar.gz"
      sha256 "9dac7c42904ca07205215012d1d3518cf7419f9cbede66cb80c7e5acf1338465"
      define_method(:install) { bin.install "truzt" }
    end
  end

  test do
    system "#{bin}/truzt version"
  end
end
