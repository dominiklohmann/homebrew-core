class Pnpm < Formula
  require "language/node"

  desc "📦🚀 Fast, disk space efficient package manager"
  homepage "https://pnpm.js.org"
  url "https://registry.npmjs.org/pnpm/-/pnpm-5.10.4.tgz"
  sha256 "9e4774b1f1baec04917b83b9400c1ffea25ed3ffed4ce1b80d5b2e065722cbc8"
  license "MIT"

  livecheck do
    url :stable
  end

  bottle do
    cellar :any_skip_relocation
    sha256 "7fb9cacc6e0e28aa4d62ca618fb7832cd20dba8cf529d8dcaa02e6a8c55dcf74" => :catalina
    sha256 "09e2d0777f394c15691d3f4aaf3b1e80ab0048f177a11710b471c21e26c9cc58" => :mojave
    sha256 "a2f2da1ce039a9a6b764c9219116508e6ddca8e8bcba433214fcbecec20d17da" => :high_sierra
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/pnpm", "init", "-y"
    assert_predicate testpath/"package.json", :exist?, "package.json must exist"
  end
end
