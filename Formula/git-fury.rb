class GitFury < Formula
  desc "Enables shorthand git syntax and allows users to add notes to branches"
  homepage "https://github.com/greghuels/git-fury"
  url "https://github.com/greghuels/git-fury/archive/refs/tags/1.4.2.tar.gz"
  sha256 "68d93a6788804086adf90132e45031fbb1cd528c4297feeccd1ccbe6a8899b82"
  license "MIT"

  bottle do
    root_url "https://github.com/greghuels/homebrew-tap/releases/download/git-fury-1.4.2"
    sha256 cellar: :any_skip_relocation, catalina:     "486ae47545f52d85db298d736ed199ac60bab01a7475dec124f17d9dba79e1f5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1ae97e4afbdd9849b3559cfdcd2924b611d8d1c98e5cc1c7b99870f3d28a3cfe"
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
