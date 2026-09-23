class Klassify < Formula
  desc "System One classification CLI and MCP server"
  homepage "https://github.com/fajarnuha/klassify"
  url "https://github.com/fajarnuha/klassify/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "a59e38a5fd042efc6dbd42f8cc998ccb466c6d3885c9cbda3e5997abf0e78000"
  license "Apache-2.0"

  depends_on :macos

  resource "binary" do
    on_arm do
      url "https://github.com/fajarnuha/klassify/releases/download/v0.1.2/klassify-macos-arm64.tar.gz"
      sha256 "a3fd5572378178103e99137bacc07b9b3a2eeab6e9f88f41cc56b0e412e49f18"
    end

    on_intel do
      url "https://github.com/fajarnuha/klassify/releases/download/v0.1.2/klassify-macos-x64.tar.gz"
      sha256 "687cfc5e884ee207d4546181fa0848c7c7d569a72640cbae60a049cabe65de19"
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
