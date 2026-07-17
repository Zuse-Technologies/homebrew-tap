# typed: false
# frozen_string_literal: true
# Auto-updated by the Truzt release pipeline. DO NOT EDIT.
class Truzt < Formula
  desc "Truzt — secure mesh network client."
  homepage "https://truzt.lk/"
  version "2.8.3"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.intel?
      url "https://pkgs.truzt.lk/release/v2.8.3/truzt_2.8.3_darwin_amd64.tar.gz"
      sha256 "266cff7cff3976fbf0238def43447abbe68089a2ae3198f188f9873c894f5346"
      define_method(:install) { bin.install "truzt" }
    end
    if Hardware::CPU.arm?
      url "https://pkgs.truzt.lk/release/v2.8.3/truzt_2.8.3_darwin_arm64.tar.gz"
      sha256 "6daf8b575fdd81ccec5640e39e458306d955c4a8b83acb2daee4939730a82ad5"
      define_method(:install) { bin.install "truzt" }
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://pkgs.truzt.lk/release/v2.8.3/truzt_2.8.3_linux_amd64.tar.gz"
      sha256 "04e99b86c0471de0e615dca3af94e17752879355ba7b196b08e6114be4c58239"
      define_method(:install) { bin.install "truzt" }
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://pkgs.truzt.lk/release/v2.8.3/truzt_2.8.3_linux_arm64.tar.gz"
      sha256 "4bc0b56ec8276bba8776711f9dc37d2ca4be5b046f7b22b9e89a1027ef6bc7a2"
      define_method(:install) { bin.install "truzt" }
    end
  end

  test do
    system "#{bin}/truzt version"
  end
end
