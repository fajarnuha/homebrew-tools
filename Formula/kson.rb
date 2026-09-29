class Kson < Formula
  desc "JSON toolkit with jq-compatible queries"
  homepage "https://github.com/fajarnuha/kson"
  url "https://github.com/fajarnuha/kson/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "9b95c69038b043dc2015ad1851310756e082b2e8c3f1091a20c02d8cb21ec183"
  license "Apache-2.0"

  depends_on :macos

  resource "binary" do
    on_arm do
      url "https://github.com/fajarnuha/kson/releases/download/v0.6.0/kson-macos-arm64.tar.gz"
      sha256 "711ce9f3583ace01274bbdccedac5fae112984c1a0baf47e59798a9e6f939fb0"
    end

    on_intel do
      url "https://github.com/fajarnuha/kson/releases/download/v0.6.0/kson-macos-x64.tar.gz"
      sha256 "c217f0c93475a916d382e4c99a64ac1f49880038d13481d0b23b743763817e9b"
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
