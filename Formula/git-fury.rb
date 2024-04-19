class GitFury < Formula
  desc "Enables shorthand git syntax and allows users to add notes to branches"
  homepage "https://github.com/greghuels/git-fury"
  url "https://github.com/greghuels/git-fury/archive/refs/tags/1.4.3.tar.gz"
  sha256 "8bcf9552b5a6c0916fbc53f02b65ad2e398a11d1e49c731cadbe969755f82b09"
  license "MIT"

  bottle do
    root_url "https://github.com/greghuels/homebrew-tap/releases/download/git-fury-1.4.3"
    sha256 cellar: :any_skip_relocation, monterey:     "4e5560d7a335087bbcea2bcb0e0d4ceff5ec29061dce681fa55c93195a373109"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "aed011f83bbaa948284269399bc78667305c09f9d12bcc815f45d50881c79cb7"
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
