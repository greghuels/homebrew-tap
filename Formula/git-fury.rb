class GitFury < Formula
  desc "Enables shorthand git syntax and allows users to add notes to branches"
  homepage "https://github.com/greghuels/git-fury"
  url "https://github.com/greghuels/git-fury/archive/refs/tags/1.4.0.tar.gz"
  sha256 "73231c4f5000e4a96b368d800cd1b13af76831a8a05a40440304019893031cc3"
  license "MIT"

  bottle do
    root_url "https://github.com/greghuels/homebrew-tap/releases/download/git-fury-1.4.0"
    sha256 cellar: :any_skip_relocation, catalina:     "1d861bc1677b336eedb5cd7f9ec9af3cd00e3fa60a7b9b6b08b9e4f1da400048"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b7d02e12cb5bedfc9c3f32fb7b0b4566ca20d29a5cf14e2536635de9819c1939"
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
