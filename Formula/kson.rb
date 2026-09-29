class Kson < Formula
  desc "JSON toolkit with jq-compatible queries"
  homepage "https://github.com/fajarnuha/kson"
  url "https://github.com/fajarnuha/kson/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "18493cd6e34c45e7f364f63fd3788367f083b9c3b60138ffee96adfd1bbc1b1f"
  license "Apache-2.0"

  depends_on :macos

  resource "binary" do
    on_arm do
      url "https://github.com/fajarnuha/kson/releases/download/v0.5.0/kson-macos-arm64.tar.gz"
      sha256 "29d842014c65e721d7cb3a4af1e07c8621ba4e711b84e4cd695df4a2e289d855"
    end

    on_intel do
      url "https://github.com/fajarnuha/kson/releases/download/v0.5.0/kson-macos-x64.tar.gz"
      sha256 "1c68557e15a9f51470f867c910226a0395a19d7aa48deb6bfae23bbd852428c5"
    end
  end

  def install
    resource("binary").stage do
      bin.install "kson"
      pkgshare.install "LICENSE"
    end
  end

  test do
    assert_equal "kson #{version}", shell_output("#{bin}/kson --version").strip
    (testpath/"input.json").write('{"answer":42}')
    assert_equal "42", shell_output("#{bin}/kson -r .answer #{testpath}/input.json").strip
  end
end
