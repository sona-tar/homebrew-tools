require "language/go"

class Ghs < Formula
  homepage "https://github.com/sona-tar/ghs"
  url  "https://github.com/sona-tar/ghs", :using => :git, :tag => "0.0.10"
  head "https://github.com/sona-tar/ghs", :using => :git, :branch => "master"

  depends_on "go" => :build
  depends_on "mercurial" => :build

  go_resource "github.com/google/go-github" do
    url "https://github.com/google/go-github.git", :branch => "master"
  end

  go_resource "github.com/jessevdk/go-flags" do
    url "https://github.com/jessevdk/go-flags.git", :branch => "master"
  end

  go_resource "github.com/tcnksm/go-latest" do
    url "https://github.com/tcnksm/go-latest.git", :branch => "master"
  end

  go_resource "github.com/motemen/go-gitconfig" do
    url "https://github.com/motemen/go-gitconfig.git", :branch => "master"
  end

  go_resource "golang.org/x/net" do
    url "https://github.com/golang/net.git", :branch => "master"
  end

  go_resource "golang.org/x/oauth2" do
    url "https://github.com/golang/oauth2.git", :branch => "master"
  end

  go_resource "github.com/hashicorp/go-version" do
    url "https://github.com/hashicorp/go-version.git", :branch => "master"
  end

  go_resource "github.com/google/go-querystring" do
    url "https://github.com/google/go-querystring.git", :branch => "master"
  end
  # go_resource "" do
  #   url "https://.git", :branch => "master"
  # end


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
