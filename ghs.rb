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
  head 'https://github.com/sona-tar/ghs', :using => :git, :branch => 'master'

  if build.head?
    depends_on 'go' => :build
    depends_on 'git' => :build
  end

  def install
    if build.head?
      gopath = buildpath/'.go'

      ( gopath/'src/github.com/sona-tar/ghs' ).make_relative_symlink buildpath

      ENV['GOPATH'] = gopath
      system 'go', 'build'
      system 'go', 'install'

    end

    if build.with? 'completions'
      zsh_completion.install 'zsh/_ghq'
    end

    bin.install 'ghs'
  end
end
