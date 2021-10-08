class GitFury < Formula
  desc "Enables shorthand git syntax and allows users to add notes to branches"
  homepage "https://github.com/greghuels/git-fury"
  url "https://github.com/greghuels/git-fury/archive/refs/tags/1.4.1.tar.gz"
  sha256 "40458f6c7910d4d69df539531459ab874ce4e15f162f9543441b2f80899d00fd"
  license "MIT"

  bottle do
    root_url "https://github.com/greghuels/homebrew-tap/releases/download/git-fury-1.4.1"
    sha256 cellar: :any_skip_relocation, catalina:     "a2d654da68d53ea23ee3f59c1db4fe74c257c79b2d1280f0c2daae95369a63c7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4689763423af51d81d3b3564e4e4492cb37ab240ff4bc948cf08a8bfbb8286f0"
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
