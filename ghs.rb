require 'formula'

VERSION='0.0.3'
class Ghs < Formula
  homepage 'https://github.com/sona-tar/ghs'
  if OS.mac?
    if Hardware.is_64_bit?
      url "https://github.com/sona-tar/ghs/releases/download/#{VERSION}/ghs-#{VERSION}-darwin_amd64.zip"
      sha1 '55668c47e1dba9a2a4dbda02e69698ab83052dc4'
    else
      url "https://github.com/sona-tar/ghs/releases/download/#{VERSION}/ghs-#{VERSION}-darwin_386.zip"
      sha1 '55dd1ea979bfc32abf099d45d848e1f1e97544b7'
    end
  elsif OS.linux?
    if Hardware.is_64_bit?
      url "https://github.com/sona-tar/ghs/releases/download/#{VERSION}/ghs-#{VERSION}-linux_amd64.tar.gz"
      sha1 '6ef6a5de959085e909d76f8b5d3088b8abf16286'
    else
      url "https://github.com/sona-tar/ghs/releases/download/#{VERSION}/ghs-#{VERSION}-linux_386.tar.gz"
      sha1 '5453a2389782ffffef2a4e593b9ac0005d215392'
    end
  end

  version VERSION

  def install
    bin.install 'ghs'
  end
end
