# typed: false
# frozen_string_literal: true
# Auto-updated by the Truzt release pipeline. DO NOT EDIT.
class Truzt < Formula
  desc "Truzt — secure mesh network client."
  homepage "https://truzt.lk/"
  version "2.9.1"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.intel?
      url "https://pkgs.truzt.lk/release/v2.9.1/truzt_2.9.1_darwin_amd64.tar.gz"
      sha256 "4a5d75a7b1d3ad964a26c497ba4d82b8c97540ca7708c9cb49e2bb4285b37242"
      define_method(:install) { bin.install "truzt" }
    end
    if Hardware::CPU.arm?
      url "https://pkgs.truzt.lk/release/v2.9.1/truzt_2.9.1_darwin_arm64.tar.gz"
      sha256 "513ac1b0fa393afe1fe37c65ed0e1f27ef49625303c9e3ba0c0c35748a5928e3"
      define_method(:install) { bin.install "truzt" }
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://pkgs.truzt.lk/release/v2.9.1/truzt_2.9.1_linux_amd64.tar.gz"
      sha256 "ed60b812ac53017d610bf5116570c6a91a870212a7acd19b270c004aa92b77a5"
      define_method(:install) { bin.install "truzt" }
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://pkgs.truzt.lk/release/v2.9.1/truzt_2.9.1_linux_arm64.tar.gz"
      sha256 "f8c4222547f7081b86c9cef3e4765fb455bb5ee2cbeb72b421f493774679f419"
      define_method(:install) { bin.install "truzt" }
    end
  end

  test do
    system "#{bin}/truzt version"
  end
end
