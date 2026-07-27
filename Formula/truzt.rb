# typed: false
# frozen_string_literal: true
# Auto-updated by the Truzt release pipeline. DO NOT EDIT.
class Truzt < Formula
  desc "Truzt — secure mesh network client."
  homepage "https://truzt.lk/"
  version "2.9.0"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.intel?
      url "https://pkgs.truzt.lk/release/v2.9.0/truzt_2.9.0_darwin_amd64.tar.gz"
      sha256 "a64ecaa6cc10f98f44b6118ed8ad21f1346afc5de97d87eee5e635c8d75f3815"
      define_method(:install) { bin.install "truzt" }
    end
    if Hardware::CPU.arm?
      url "https://pkgs.truzt.lk/release/v2.9.0/truzt_2.9.0_darwin_arm64.tar.gz"
      sha256 "4b86a303815815a706f7ed506ce9dcd82bb65c9ac100f4265fcc2ebcf666f1d3"
      define_method(:install) { bin.install "truzt" }
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://pkgs.truzt.lk/release/v2.9.0/truzt_2.9.0_linux_amd64.tar.gz"
      sha256 "fcddf2a502f3ee4829aef389fdbace83ca9edca876133d3fad6af4ca00421b7a"
      define_method(:install) { bin.install "truzt" }
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://pkgs.truzt.lk/release/v2.9.0/truzt_2.9.0_linux_arm64.tar.gz"
      sha256 "14aa2e1c8732c486cb6c8ab149703d87f2bcf72eb5174a83f6365698d5e4cef9"
      define_method(:install) { bin.install "truzt" }
    end
  end

  test do
    system "#{bin}/truzt version"
  end
end
