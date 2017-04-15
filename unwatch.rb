require "language/go"

class Unwatch < Formula
  homepage "https://github.com/sona-tar/github-unwatch-cli"
  url  "https://github.com/sona-tar/github-unwatch-cli", :using => :git, :tag => "0.0.1"
  head "https://github.com/sona-tar/github-unwatch-cli", :using => :git, :branch => "master"

  depends_on "go" => :build
  depends_on :hg => :build

  go_resource "github.com/google/go-github" do
    url "https://github.com/google/go-github.git", :branch => "master"
  end

  go_resource "github.com/google/go-querystring" do
    url "https://github.com/google/go-querystring.git", :branch => "master"
  end
  # go_resource "" do
  #   url "https://.git", :branch => "master"
  # end


  def install
    ENV["GOPATH"] = buildpath
    mkdir_p buildpath/"src/github.com/sona-tar/github-unwatch-cli"
    ln_sf buildpath, buildpath/"src/github.com/sona-tar/github-unwatch-cli"
    Language::Go.stage_deps resources, buildpath/"src"

    # Build and install
    system "go", "build", "-o", "unwatch"
    bin.install "unwatch"
  end
end
