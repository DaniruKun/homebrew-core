require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-2.1.12.tgz"
  sha256 "d038d31eece83e68d6de9b26e7005a5c271faba42144faf4c471978c64a0fa1e"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "8f40e96815a94828d61abec8965857337024e05418ea24ef326344ad14cd2e85"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
