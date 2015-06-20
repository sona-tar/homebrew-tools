require "language/go"

class Ghs < Formula
  homepage "https://github.com/sona-tar/ghs"
  url  "https://github.com/sona-tar/ghs", :using => :git, :tag => "0.0.4"
  head "https://github.com/sona-tar/ghs", :using => :git, :branch => "master"

  depends_on "go" => :build
  depends_on :hg => :build

  go_resource "github.com/google/go-github" do
    url "https://github.com/google/go-github.git", :branch => "master"
  end
  
  go_resource "github.com/jessevdk/go-flags" do
    url "https://github.com/jessevdk/go-flags.git", :branch => "master"
  end
  
  go_resource "github.com/mgutz/ansi" do
    url "https://github.com/mgutz/ansi.git", :branch => "master"
  end
  
  go_resource "github.com/tcnksm/go-latest" do
    url "https://github.com/tcnksm/go-latest.git", :branch => "master"
  end

  def install
    ENV["GOPATH"] = buildpath
    mkdir_p buildpath/"src/github.com/sona-tar/ghs"
    ln_sf buildpath, buildpath/"src/github.com/sona-tar/ghs"
    Language::Go.stage_deps resources, buildpath/"src"

    # Build and install
    system "go", "build", "-o", "ghs"
    bin.install "ghs"
  end
end
