TERMUX_PKG_HOMEPAGE="https://github.com/debrouxl"
TERMUX_PKG_DESCRIPTION="Provides libtifiles2 library and headers for TiEmu and TiLP"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="3ls-it <3ls-it@pm.me>"
TERMUX_PKG_VERSION=1.1.8
TERMUX_PKG_SRCURL="git+https://github.com/debrouxl/tilibs.git"
TERMUX_PKG_GIT_BRANCH="tiz80romdumpers"
TERMUX_PKG_SHA256="SKIP_CHECKSUM"
TERMUX_PKG_AUTO_UPDATE=false
TERMUX_PKG_DEPENDS="glib, libarchive, libticonv"


termux_step_pre_configure() {
		cd "$TERMUX_PKG_SRCDIR/libtifiles/trunk"
		autoreconf -fi
}

termux_step_configure() {
		cd "$TERMUX_PKG_SRCDIR/libtifiles/trunk"
		./configure \
				--prefix=$PREFIX \
				--host=$TERMUX_HOST_PLATFORM
}

termux_step_make() {
		cd "$TERMUX_PKG_SRCDIR/libtifiles/trunk"
		make
}

termux_step_make_install() {
		cd "$TERMUX_PKG_SRCDIR/libtifiles/trunk"
		make install
}
