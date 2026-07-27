# typed: false
# frozen_string_literal: true
# Auto-updated by the Truzt release pipeline. DO NOT EDIT.
class Truzt < Formula
  desc "Truzt — secure mesh network client."
  homepage "https://truzt.lk/"
  version "2.8.5"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.intel?
      url "https://pkgs.truzt.lk/release/v2.8.5/truzt_2.8.5_darwin_amd64.tar.gz"
      sha256 "5ef9ab9caa6d3554c31052cb0e0b3dbbf6e01d1b1815583c58c803839a5ff785"
      define_method(:install) { bin.install "truzt" }
    end
    if Hardware::CPU.arm?
      url "https://pkgs.truzt.lk/release/v2.8.5/truzt_2.8.5_darwin_arm64.tar.gz"
      sha256 "375354b63de5fb8279e5f279f521515200fd7fee990b4bb06248016f2197eb71"
      define_method(:install) { bin.install "truzt" }
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://pkgs.truzt.lk/release/v2.8.5/truzt_2.8.5_linux_amd64.tar.gz"
      sha256 "aff4126e259e87f455551cbc8d6555df1e460aedabd3a9f399dc600f171ce799"
      define_method(:install) { bin.install "truzt" }
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://pkgs.truzt.lk/release/v2.8.5/truzt_2.8.5_linux_arm64.tar.gz"
      sha256 "78c48ff65b289fc8cb69258b2b19cc1cbc77e6a1d81015b1c3006d6ba3ae796a"
      define_method(:install) { bin.install "truzt" }
    end
  end

  test do
    system "#{bin}/truzt version"
  end
end
