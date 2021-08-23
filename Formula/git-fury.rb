class GitFury < Formula
  desc "Enables shorthand git syntax and allows users to add notes to branches"
  homepage "https://github.com/greghuels/git-fury"
  url "https://github.com/greghuels/git-fury/archive/refs/tags/1.3.0.tar.gz"
  sha256 "04eeadb62d2f59c300e067adbc00687cda609b3b0521129cdf7752351e54cb61"
  license "MIT"

  bottle do
    root_url "https://github.com/greghuels/homebrew-tap/releases/download/git-fury-1.3.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, catalina:     "24eaa517c28c4b7a74050c30efd10d06b9437e8af2c49184c5cfdbf9d3bcb19a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1d5cd03c0585da0a820e4cb5d928675c2d21c1a3fdd69bbaaf625d78e29245bb"
  end

  depends_on "deno" => :build

  def install
    system "deno", "compile", "--allow-run", "--output=git-fury", "./mod.ts"
    bin.install "git-fury"
  end

  test do
    system "#{bin}/git-fury", "--version"
  end
end
