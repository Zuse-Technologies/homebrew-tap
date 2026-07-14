# Truzt Desktop — secure mesh network client (daemon + UI).
# Auto-updated by the Truzt release pipeline.
cask "truzt" do
  arch arm: "arm64", intel: "amd64"

  version "2.8.2"
  sha256 arm:   "73b8cd4e96373d558304dffd7c69bff091378ee8428de2aefe976a512c8e3f07",
         intel: "15925b345dc3f25ff94dbe9cb0d74904df1c5c01a05b345e5c21abe0ddbb2890"

  url "https://pkgs.truzt.lk/release/v#{version}/Truzt-#{arch}-#{version}.pkg"
  name "Truzt"
  desc "Secure mesh network client with desktop UI"
  homepage "https://truzt.lk/"

  installer script: {
    executable: "/usr/sbin/installer",
    args:       ["-pkg", "#{staged_path}/Truzt-#{arch}-#{version}.pkg", "-target", "/", "-allowUntrusted"],
    sudo:       true,
  }

  postflight do
    # Truzt ships unsigned/un-notarized but is trusted. Strip the
    # Gatekeeper quarantine attribute so the app launches without the
    # "damaged / unidentified developer" block. Best-effort.
    system_command "/usr/bin/xattr",
         args: ["-dr", "com.apple.quarantine", "/Applications/Truzt.app"],
         sudo: true
    ohai "Truzt installed successfully! Run 'truzt up' to connect."
  end

  # Cover current + legacy service labels/paths. Older manual installs
  # shipped inner binaries named 'trust'/'netbird' with matching launchd
  # labels; a plain launchctl: "truzt" would leave those running.
  uninstall launchctl: ["truzt", "trust", "netbird"],
  pkgutil:   ["lk.truzt.app", "com.zuselk.Truzt"],
  delete:    [
    "/usr/local/bin/truzt",
    "/usr/local/bin/truzt-ui",
    "/usr/local/bin/trust",
    "/usr/local/bin/trust-ui",
    "/Applications/Truzt.app",
    "/Applications/Trust.app",
  ]

  zap trash: [
    "~/Library/Application Support/Truzt",
    "~/Library/Caches/Truzt",
    "~/Library/Preferences/lk.truzt.app.plist",
  ]
end
