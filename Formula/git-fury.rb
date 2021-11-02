class GitFury < Formula
  desc "Enables shorthand git syntax and allows users to add notes to branches"
  homepage "https://github.com/greghuels/git-fury"
  url "https://github.com/greghuels/git-fury/archive/refs/tags/1.4.2.tar.gz"
  sha256 "68d93a6788804086adf90132e45031fbb1cd528c4297feeccd1ccbe6a8899b82"
  license "MIT"

  depends_on "deno" => :build

  def install
    system "deno", "compile", "--allow-run", "--output=git-fury", "./mod.ts"
    bin.install "git-fury"
  end

  test do
    system "#{bin}/git-fury", "--version"
  end
end
