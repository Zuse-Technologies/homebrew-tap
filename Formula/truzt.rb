# typed: false
# frozen_string_literal: true
# Auto-updated by the Truzt release pipeline. DO NOT EDIT.
class Truzt < Formula
  desc "Truzt — secure mesh network client."
  homepage "https://truzt.lk/"
  version "2.8.4"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.intel?
      url "https://pkgs.truzt.lk/release/v2.8.4/truzt_2.8.4_darwin_amd64.tar.gz"
      sha256 "54f0e63afc6d6bf261d364cb8641dfaf72ed5445ca53138d11fdec3ec54a9b9c"
      define_method(:install) { bin.install "truzt" }
    end
    if Hardware::CPU.arm?
      url "https://pkgs.truzt.lk/release/v2.8.4/truzt_2.8.4_darwin_arm64.tar.gz"
      sha256 "7bf48f7384cb2649733ab3320844ee7f9fd7197dff23940e8b32fa7473110fc7"
      define_method(:install) { bin.install "truzt" }
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://pkgs.truzt.lk/release/v2.8.4/truzt_2.8.4_linux_amd64.tar.gz"
      sha256 "b8f84aacd90d1457ceed85f452aca35d35d9114e111f69c0b4a3bf2592661dd8"
      define_method(:install) { bin.install "truzt" }
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://pkgs.truzt.lk/release/v2.8.4/truzt_2.8.4_linux_arm64.tar.gz"
      sha256 "d83e7665452d4312af69fc025f27f06aa8311af1bed8486b4318f7b4cbfb0e7f"
      define_method(:install) { bin.install "truzt" }
    end
  end

  test do
    system "#{bin}/truzt version"
  end
end
