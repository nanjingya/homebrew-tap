cask "aurora-music" do
  version "1.2.0"

  on_arm do
    sha256 "b36b55e8cfbdbf3b99f29becbafa39574606d736e15dc821142e88e680444874"
    url "https://github.com/nanjingya/Aurora-Music/releases/download/v#{version}/Aurora-Music-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "f6c9248c49ce1c2d6d03cbb0f15d0e331beb3b74d13f76d88d83d66c61d1956d"
    url "https://github.com/nanjingya/Aurora-Music/releases/download/v#{version}/Aurora-Music-#{version}-mac-x64.dmg"
  end

  name "Aurora Music"
  desc "Immersive music player with lyrics stage, particle visuals, and 3D playlist shelf"
  homepage "https://github.com/nanjingya/Aurora-Music"

  app "Aurora Music.app"

  depends_on macos: :monterey

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Aurora Music.app"]
  end

  livecheck do
    url :homepage
    strategy :github_latest
  end

  caveats <<~EOS
    Aurora Music is not notarized. If macOS still blocks launch, allow it under
    System Settings → Privacy & Security.
  EOS
end
