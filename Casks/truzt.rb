# Truzt Desktop — secure mesh network client (daemon + UI).
# Auto-updated by the Truzt release pipeline.
cask "truzt" do
  arch arm: "arm64", intel: "amd64"

  version "2.8.3"
  sha256 arm:   "b17df75183c5af67e8baf4828cd7d9d14e44c9496cf920233230c041d0f33efe",
         intel: "27ef3d3b8001d433dc1eeac94aa0d7bf5e6cc2da2b6b0f05710a4698a6bb741f"

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
