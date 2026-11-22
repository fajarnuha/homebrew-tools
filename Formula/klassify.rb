class Klassify < Formula
  desc "System One classification CLI and MCP server"
  homepage "https://github.com/fajarnuha/klassify"
  url "https://github.com/fajarnuha/klassify/archive/refs/tags/0.5.0.tar.gz"
  sha256 "cf2a2e06fe68b69aa44aa866b56aca936ec442eb320055c68bff41b313593d73"
  license "Apache-2.0"

  depends_on :macos

  resource "binary" do
    on_arm do
      url "https://github.com/fajarnuha/klassify/releases/download/0.5.0/klassify-macos-arm64.tar.gz"
      sha256 "666be723eed7000e6187828e89f5fc538d4dd6ec0c6a98a07f1a23bb1815864b"
    end

    on_intel do
      url "https://github.com/fajarnuha/klassify/releases/download/0.5.0/klassify-macos-x64.tar.gz"
      sha256 "0e0613330412150ec6a48e09d8b03fd7e1afa19bfc30b345101e65498be47cae"
    end
  end

  def install
    resource("binary").stage do
      bin.install "klassify"
      libexec.install "klassify-recipe-runner" if File.directory?("klassify-recipe-runner")
      pkgshare.install "LICENSE"
    end
  end

  test do
    assert_match "  run\n", shell_output("#{bin}/klassify --help")
    assert_match "-j, --state-json", shell_output("#{bin}/klassify run --help")
  end
end
