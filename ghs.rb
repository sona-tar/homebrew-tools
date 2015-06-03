require 'formula'

VERSION='0.0.3'
class Ghs < Formula
  homepage 'https://github.com/sona-tar/ghs'
  if OS.mac?
    url "https://github.com/sona-tar/ghs/releases/download/#{VERSION}/ghs-#{VERSION}-darwin_amd64.zip"
    sha1 '55668c47e1dba9a2a4dbda02e69698ab83052dc4'
  elsif OS.linux?
    url "https://github.com/sona-tar/ghs/releases/download/#{VERSION}/ghs-#{VERSION}-linux_amd64.tar.gz"
    sha1 "6ef6a5de959085e909d76f8b5d3088b8abf16286"
  end

  version VERSION
  head 'https://github.com/sona-tar/ghs', :using => :git, :branch => 'master'

  if build.head?
    depends_on 'go' => :build
  end

  def install
    if build.head?
      gopath = buildpath/'.go'

      ( gopath/'src/github.com/sona-tar/ghs' ).make_relative_symlink buildpath

      ENV['GOPATH'] = gopath
      system 'go', 'build'

    end

    bin.install 'ghs'
  end
end
