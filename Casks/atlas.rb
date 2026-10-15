cask "atlas" do
  version "1.8"
  sha256 "1dbd6e0b82666df839b530e6c646ac7660ae0b225228999f0bb4f4b9f99ac044"

  url "https://github.com/asekachov/Atlas/releases/download/v#{version}/Atlas.dmg"
  name "Atlas"
  desc "Visual library for images, videos, links and colors"
  homepage "https://atlasformac.com/"

  livecheck do
    url "https://pub-14c355775d264bd9841150766d7d62c4.r2.dev/atlas-3221eb554050526c/prod/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Atlas.app"

  # The library itself (~/Library/Application Support/Atlas) holds the user's
  # saved images and is deliberately left out of zap.
  zap trash: [
    "~/Library/Caches/com.asekachov.Atlas",
    "~/Library/Caches/com.asekachov.Atlas.cli",
    "~/Library/Containers/com.asekachov.Atlas.Share",
    "~/Library/Containers/com.asekachov.Atlas.WebExtension",
    "~/Library/HTTPStorages/com.asekachov.Atlas",
    "~/Library/HTTPStorages/com.asekachov.Atlas.binarycookies",
    "~/Library/Preferences/com.asekachov.Atlas.plist",
    "~/Library/Saved Application State/com.asekachov.Atlas.savedState",
    "~/Library/WebKit/com.asekachov.Atlas",
  ]
end
