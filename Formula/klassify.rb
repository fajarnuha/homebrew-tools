class Klassify < Formula
  desc "System One classification CLI and MCP server"
  homepage "https://github.com/fajarnuha/klassify"
  url "https://github.com/fajarnuha/klassify/archive/refs/tags/0.4.0.tar.gz"
  sha256 "ce7cdd0d9d96765447e10ec4da48689e8839441c618c82e3991ec47616c48633"
  license "Apache-2.0"

  depends_on :macos

  resource "binary" do
    on_arm do
      url "https://github.com/fajarnuha/klassify/releases/download/0.4.0/klassify-macos-arm64.tar.gz"
      sha256 "2eff12a68902ebf9a84a30a5056b5897a593daa765282f344e029b7c6fb721dc"
    end

    on_intel do
      url "https://github.com/fajarnuha/klassify/releases/download/0.4.0/klassify-macos-x64.tar.gz"
      sha256 "d899c0b68824d532c1214998e55b8177d1fb26af865ab75001b271cbd365e5dd"
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
