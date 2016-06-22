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

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    args = %W[
        CC=#{ENV.cc}
        CXX=#{ENV.cxx}
      ]

    system "./bootstrap"
    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          *args

    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test kalibrate`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
