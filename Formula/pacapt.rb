class Pacapt < Formula
  desc "Package manager in the style of Arch's pacman"
  homepage "https://github.com/icy/pacapt"
  url "https://github.com/icy/pacapt/archive/v2.4.3.tar.gz"
  sha256 "4dcf0bad070b09267b9c7b77bf5f9ff525c57915a17e9ee63e1ee53413a635ff"
  license "Fair"

  bottle do
    cellar :any_skip_relocation
    sha256 "88560339524e9f110cb58ddd3e8744cc44d6e24f86c0b9ca05ef01a059c55be2" => :catalina
    sha256 "88560339524e9f110cb58ddd3e8744cc44d6e24f86c0b9ca05ef01a059c55be2" => :mojave
    sha256 "88560339524e9f110cb58ddd3e8744cc44d6e24f86c0b9ca05ef01a059c55be2" => :high_sierra
  end

  def install
    bin.mkpath
    system "make", "install", "BINDIR=#{bin}", "VERSION=#{version}"
  end

  test do
    system "#{bin}/pacapt", "-Ss", "wget"
  end
end
