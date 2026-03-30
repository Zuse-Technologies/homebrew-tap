# Truzt Desktop — secure mesh network client (daemon + UI).
# Auto-updated by the Truzt release pipeline.
cask "truzt" do
  arch arm: "arm64", intel: "amd64"

  version "2.7.2"
  sha256 arm:   "e769fba34034e0f574e7c8f973aa540bc802de636bd04bd34edadcb173adba02",
         intel: "1a5868fc75b9d233769b882f757260cb9397e0a610c5a12bc3f8274944b2f039"

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
