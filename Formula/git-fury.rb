class GitFury < Formula
  desc "Enables shorthand git syntax and allows users to add notes to branches"
  homepage "https://github.com/greghuels/git-fury"
  url "https://github.com/greghuels/git-fury/archive/refs/tags/1.4.4.tar.gz"
  sha256 "d43d859c3571082d4d19323ac8f238de6116699ddcb1d52ea7e260116c1620d7"
  license "MIT"

  bottle do
    root_url "https://github.com/greghuels/homebrew-tap/releases/download/git-fury-1.4.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e927f38c63a195048a6ec2d2ef76d2d79b87c9a6c6f1307b6b182c91e8378b89"
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
