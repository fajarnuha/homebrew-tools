class Klassify < Formula
  desc "System One classification CLI and MCP server"
  homepage "https://github.com/fajarnuha/klassify"
  url "https://github.com/fajarnuha/klassify/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ad154511030fba46a302bf0099d24c5099fa21a826a1260690d22d071340db62"
  license "Apache-2.0"

  depends_on :macos

  resource "binary" do
    on_arm do
      url "https://github.com/fajarnuha/klassify/releases/download/v0.1.0/klassify-macos-arm64.tar.gz"
      sha256 "7dbe59a1a55ff5a3d38575e186358348af2e0aca1472d09a8495b225119f2b3e"
    end

    on_intel do
      url "https://github.com/fajarnuha/klassify/releases/download/v0.1.0/klassify-macos-x64.tar.gz"
      sha256 "b5d773d45c52ade02f7ae4f5df08087448d0a5937cbec74dd8f59cc9ffbb0401"
    end
  end

  def install
    resource("binary").stage do
      bin.install "klassify"
      pkgshare.install "LICENSE"
    end
  end

  test do
    assert_match "Commands:", shell_output("#{bin}/klassify --help")
  end
end
