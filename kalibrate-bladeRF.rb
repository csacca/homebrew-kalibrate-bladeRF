# Documentation: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class KalibrateBladerf < Formula
  desc "kalibrate-bladeRF"
  homepage "https://github.com/Nuand/kalibrate-bladeRF"
  head "https://github.com/Nuand/kalibrate-bladeRF.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkgconfig" => :build
  depends_on "fftw"

  patch do
    url "https://raw.githubusercontent.com/csacca/homebrew-kalibrate-bladeRF/master/el-capitan.diff"
    sha256 "65247c2839d7dfc58d96df917f5aa967210d32ace66b21dcc85377204cf98b79"
  end

  def install
    args = %W[
        CC=#{ENV.cc}
        CXX=#{ENV.cxx}
      ]

    system "./bootstrap"
    
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          *args

    system "make", "install" # if this fails, try separate make/make install steps
  end

end
