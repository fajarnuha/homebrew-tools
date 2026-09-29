class Klassify < Formula
  desc "System One classification CLI and MCP server"
  homepage "https://github.com/fajarnuha/klassify"
  url "https://github.com/fajarnuha/klassify/archive/refs/tags/0.2.0.tar.gz"
  sha256 "10e4d17f3134f8335e83101a6e74ec81db8be0b21ae689fada798956e8b4f1ed"
  license "Apache-2.0"

  depends_on :macos

  resource "binary" do
    on_arm do
      url "https://github.com/fajarnuha/klassify/releases/download/0.2.0/klassify-macos-arm64.tar.gz"
      sha256 "7851635725c904a6710bd36c8aa81078b9d20e91eb818e788abee5ac428f21d8"
    end

    on_intel do
      url "https://github.com/fajarnuha/klassify/releases/download/0.2.0/klassify-macos-x64.tar.gz"
      sha256 "dafe2d3696509df44045c169e1f0fd4e7d0d84ef5a7e6c48ef686987a6780085"
    end
  end

  def install
    resource("binary").stage do
      bin.install "klassify"
      pkgshare.install "LICENSE"
    end
  end

  test do
    assert_match "  run\n", shell_output("#{bin}/klassify --help")
    assert_match "-j, --state-json", shell_output("#{bin}/klassify run --help")
  end
end
