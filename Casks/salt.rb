cask "salt" do
  version "3006.4"
  sha256 "4c624e7451bd58c6364863087dba9f425e0bc0373984cb808430e7fbeac069a5"

  url "https://repo.saltproject.io/salt/py3/macos/3006/salt-3006.4-py3-x86_64.pkg"
  name "Salt"
  desc "Event-driven automation tool for managing IT systems"
  homepage "https://saltproject.io/"

  conflicts_with formula: "salt"

  pkg "salt-3006.4-py3-x86_64.pkg"

  uninstall launchctl: "com.saltstack.salt.minion",
            pkgutil: "com.saltstack.salt"
            delete: "/opt/salt"
end
