# Truzt Desktop — secure mesh network client (daemon + UI).
# Auto-updated by the Truzt release pipeline.
cask "truzt" do
  arch arm: "arm64", intel: "amd64"

  version "2.7.2"
  sha256 arm:   "c64030a6d41f9e191c17e44d3c584e743a331e2dd2fea98a6f1b2fc88753af5f",
         intel: "e9a2700fa5e3ca1dc491b0c948fbdd7ac6c5e1027911977c8f32ffe9e2ee0f06"

  url "https://pkgs.truzt.lk/release/v#{version}/Truzt-#{arch}-#{version}.pkg"
  name "Truzt"
  desc "Secure mesh network client with desktop UI"
  homepage "https://truzt.lk/"

  pkg "Truzt-#{arch}-#{version}.pkg", allow_untrusted: true

  uninstall launchctl: "truzt",
  pkgutil:   "com.zuselk.Truzt",
  delete:    [
    "/usr/local/bin/truzt",
    "/usr/local/bin/truzt-ui",
  ]

  zap trash: [
    "~/Library/Application Support/Truzt",
    "~/Library/Caches/Truzt",
  ]
end
