require "language/go"

class Gocode < Formula
  homepage "https://github.com/nsf/gocode"
  url  "https://github.com/nsf/gocode", :using => :git, :branch => "master"
  head "https://github.com/nsf/gocode", :using => :git, :branch => "master"
  version "20151024"

  depends_on "go" => :build
  depends_on "mercurial" => :build

  def install
    ENV["GOPATH"] = buildpath
    mkdir_p buildpath/"src/github.com/nsf/gocode"
    ln_sf buildpath, buildpath/"src/github.com/nsf/gocode"
    Language::Go.stage_deps resources, buildpath/"src"

    # Build and install
    system "go", "build", "-o", "gocode"
    bin.install "gocode"
  end
end
