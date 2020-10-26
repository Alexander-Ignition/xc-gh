class XcGh < Formula
  desc "Xcode logs formatter GitHub Action"
  homepage "https://github.com/Alexander-Ignition/xc-gh"
  url "https://github.com/Alexander-Ignition/xc-gh/archive/0.0.1.tar.gz"
  sha256 "52f1037368a10aae87f7109308e57ac2ab67dbb75ad7f53480e0daa32c3406ce"
  head "https://github.com/Alexander-Ignition/xc-gh.git"
  license "MIT"

  bottle do
    root_url "https://github.com/Alexander-Ignition/xc-gh/releases/download/0.0.1"
    cellar :any_skip_relocation
    sha256 "8df90c4b1dc8821a228eabfdd09bc7587fcb5802ddcd874833f797dea7060871" => :catalina
  end

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/x86_64-apple-macosx/release/xc-gh"
  end

  test do
    system "#{bin}/#{name}", "--version"
  end
end
