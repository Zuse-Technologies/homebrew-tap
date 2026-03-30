# Truzt Desktop — secure mesh network client (daemon + UI).
# Auto-updated by the Truzt release pipeline.
cask "truzt" do
  arch arm: "arm64", intel: "amd64"

  version "2.7.2"
  sha256 arm:   "PLACEHOLDER_ARM64_SHA256",
         intel: "PLACEHOLDER_AMD64_SHA256"

  url "https://github.com/Zuse-Technologies/Trust/releases/download/v#{version}/Truzt-#{arch}-#{version}.pkg"
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
