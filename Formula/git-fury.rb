class GitFury < Formula
  desc "Enables shorthand git syntax"
  homepage "https://github.com/greghuels/git-fury"
  url "https://github.com/greghuels/git-fury/archive/refs/tags/1.3.0.tar.gz"
  sha256 "04eeadb62d2f59c300e067adbc00687cda609b3b0521129cdf7752351e54cb61"
  license "MIT"

  depends_on "deno"

  def install
    system "deno", "compile", "--allow-run", "--output=git-fury", "./mod.ts"
    bin.install "git-fury"
  end

  test do
    system "#{bin}/git-fury", "--version"
  end
end
