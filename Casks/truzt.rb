# Truzt Desktop — secure mesh network client (daemon + UI).
# Auto-updated by the Truzt release pipeline.
cask "truzt" do
  arch arm: "arm64", intel: "amd64"

  version "2.7.3"
  sha256 arm:   "494eead83b3893390b57dc77bf5e372a72557fe408cff027584ab4093d5dba41",
         intel: "233a258553e72b164ccbe88cb07130101338b15d4984cddd102b7313517df18c"

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
    ohai "Truzt installed successfully! Run 'truzt up' to connect."
  end

  uninstall launchctl: "truzt",
  pkgutil:   "com.zuselk.Truzt",
  delete:    [
    "/usr/local/bin/truzt",
    "/usr/local/bin/truzt-ui",
    "/Applications/Truzt.app",
  ]

  zap trash: [
    "~/Library/Application Support/Truzt",
    "~/Library/Caches/Truzt",
  ]
end
