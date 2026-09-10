TERMUX_PKG_HOMEPAGE="https://github.com/debrouxl"
TERMUX_PKG_DESCRIPTION="TiLP is a linking program for Texas Instruments' graphing calculators."
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="3ls-it <3ls-it@pm.me>"
TERMUX_PKG_VERSION=1.09
TERMUX_PKG_SRCURL="git+https://github.com/debrouxl/tilp_and_gfm.git"
TERMUX_PKG_GIT_BRANCH="master"
TERMUX_PKG_SHA256="SKIP_CHECKSUM"
TERMUX_PKG_AUTO_UPDATE=false
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_DEPENDS="fontconfig, freetype, gettext, glib, gtk2, libarchive, libglade2, libpng, libticables2, libticalcs2, libticonv, libtifiles2, libxml2, libexpat, libxrender, zlib"
TERMUX_PKG_BUILD_DEPENDS="autoconf"


termux_step_pre_configure() {
		cd "$TERMUX_PKG_SRCDIR/gfm/trunk"
		# We need current config.guess and config.sub
		cp -v /data/data/com.termux/files/usr/share/autoconf/build-aux/config.guess ./config.guess
		cp -v /data/data/com.termux/files/usr/share/autoconf/build-aux/config.sub ./config.sub
		autoreconf -fi
}


termux_step_configure() {
		cd "$TERMUX_PKG_SRCDIR/gfm/trunk"
		./configure \
				--prefix=$PREFIX \
				--host=$TERMUX_HOST_PLATFORM
}

termux_step_make() {
		cd "$TERMUX_PKG_SRCDIR/gfm/trunk"
		make
}


termux_step_make_install() {
		cd "$TERMUX_PKG_SRCDIR/gfm/trunk"
		make install
}

termux_step_post_make_install() {
		:
}
