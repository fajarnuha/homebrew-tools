class Klassify < Formula
  desc "System One classification CLI and MCP server"
  homepage "https://github.com/fajarnuha/klassify"
  url "https://github.com/fajarnuha/klassify/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "8123a5c41fd00bf06a5d9bf7d114508fcd09705c3b2448a10f777917354698ad"
  license "Apache-2.0"

  depends_on :macos

  resource "binary" do
    on_arm do
      url "https://github.com/fajarnuha/klassify/releases/download/v0.1.1/klassify-macos-arm64.tar.gz"
      sha256 "cbd03fa59965ac2c5a55fa776b901127171304fada55251e524e5f2356125f86"
    end

    on_intel do
      url "https://github.com/fajarnuha/klassify/releases/download/v0.1.1/klassify-macos-x64.tar.gz"
      sha256 "e8b20f3611ff3e1fed3b924a9da5aae1885ac386da6e46c0af6b234f824746ba"
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
