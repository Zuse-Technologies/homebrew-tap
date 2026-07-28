# typed: false
# frozen_string_literal: true
# Auto-updated by the Truzt release pipeline. DO NOT EDIT.
class Truzt < Formula
  desc "Truzt — secure mesh network client."
  homepage "https://truzt.lk/"
  version "2.9.2"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.intel?
      url "https://pkgs.truzt.lk/release/v2.9.2/truzt_2.9.2_darwin_amd64.tar.gz"
      sha256 "d76f17af6b851f1d554132b31f72ad075f7b805229fbb38464f548399f9f2c4e"
      define_method(:install) { bin.install "truzt" }
    end
    if Hardware::CPU.arm?
      url "https://pkgs.truzt.lk/release/v2.9.2/truzt_2.9.2_darwin_arm64.tar.gz"
      sha256 "505a533a516d649625f3e5efffdb5939e5988db1a48c34ebaff04a4bad768d19"
      define_method(:install) { bin.install "truzt" }
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://pkgs.truzt.lk/release/v2.9.2/truzt_2.9.2_linux_amd64.tar.gz"
      sha256 "92c2a22e9f5c1d0a181fdb960c7517933ad077103625cf039895fa4725bcad48"
      define_method(:install) { bin.install "truzt" }
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://pkgs.truzt.lk/release/v2.9.2/truzt_2.9.2_linux_arm64.tar.gz"
      sha256 "16f58e0a61391971542950c02562b10e98a2f55084d277175bbfc04349d9f2ed"
      define_method(:install) { bin.install "truzt" }
    end
  end

  test do
    system "#{bin}/truzt version"
  end
end
