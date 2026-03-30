# Truzt Desktop — secure mesh network client (daemon + UI).
# Auto-updated by the Truzt release pipeline.
cask "truzt" do
  arch arm: "arm64", intel: "amd64"

  version "2.7.2"
  sha256 arm:   "a4973d70bd18d1a89bedcd72022114c7c1f94e2bc605e0fe2af0554bca971662",
         intel: "6e6d517b2f1c7c60187dd483d605fa7bf7d18e58c78ffb45a8273b850048c181"

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
