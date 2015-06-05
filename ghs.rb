require 'formula'

VERSION='0.0.4'
class Ghs < Formula
  homepage 'https://github.com/sona-tar/ghs'
  if OS.mac?
    if Hardware.is_64_bit?
      url "https://github.com/sona-tar/ghs/releases/download/#{VERSION}/ghs-#{VERSION}-darwin_amd64.zip"
      sha1 'ab0108bd18978138690325e2501a7b3b53611622'
    else
      url "https://github.com/sona-tar/ghs/releases/download/#{VERSION}/ghs-#{VERSION}-darwin_386.zip"
      sha1 'ddabab2637eeeca35e37c7bebd0d0e34b272249e'
    end
  elsif OS.linux?
    if Hardware.is_64_bit?
      url "https://github.com/sona-tar/ghs/releases/download/#{VERSION}/ghs-#{VERSION}-linux_amd64.tar.gz"
      sha1 '3495553f74ba82c5d53b345643b915479ed1327e'
    else
      url "https://github.com/sona-tar/ghs/releases/download/#{VERSION}/ghs-#{VERSION}-linux_386.tar.gz"
      sha1 'b669202c5bec99dfb827c478aa1d7e5534409895'
    end
  end

  version VERSION

  def install
    bin.install 'ghs'
  end
end
