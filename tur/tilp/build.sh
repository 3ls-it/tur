TERMUX_PKG_HOMEPAGE="https://github.com/debrouxl"
TERMUX_PKG_DESCRIPTION="TiLP is a linking program for Texas Instruments' graphing calculators."
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="3ls-it <3ls-it@pm.me>"
TERMUX_PKG_VERSION=1.19
TERMUX_PKG_SRCURL="git+https://github.com/debrouxl/tilp_and_gfm.git"
TERMUX_PKG_GIT_BRANCH="master"
TERMUX_PKG_SHA256="SKIP_CHECKSUM"
TERMUX_PKG_AUTO_UPDATE=false
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_DEPENDS="gettext, glib, gtk2, libticables2, libticalcs2, libticonv, libtifiles2, termux-api, zlib"


termux_step_pre_configure() {
		cd "$TERMUX_PKG_SRCDIR/tilp/trunk"
		autoreconf -fi
}


termux_step_configure() {
		cd "$TERMUX_PKG_SRCDIR/tilp/trunk"
		./configure \
				--prefix=$PREFIX \
				--host=$TERMUX_HOST_PLATFORM
}

termux_step_make() {
		cd "$TERMUX_PKG_SRCDIR/tilp/trunk"
		make
}


termux_step_make_install() {
		cd "$TERMUX_PKG_SRCDIR/tilp/trunk"
		make install
}

termux_step_post_make_install() {
		# We rename the binary as it needs a `termux-usb` wrapper
		# for non-root
		mv "$TERMUX_PREFIX/bin/tilp" "$TERMUX_PREFIX/bin/tilp.real"

		# Install the wrapper script as `tilp`
		install -Dm700 \
				"$TERMUX_PKG_BUILDER_DIR/tilp" \
				"$TERMUX_PREFIX/bin/tilp"
}

termux_step_create_debscripts() {
		cat <<-EOF > ./postinst
						#!$TERMUX_PREFIX/bin/sh
						echo
						echo "********"
						echo "TiLP is now installed."
						echo
						echo "You will need to install the Termux:API app since the"
						echo "launcher, 'tilp', uses 'termux-usb' as a wrapper to"
						echo "give TiLP USB access to the GraphLink (SilverLink)"
						echo "device/cable."
						echo
						echo "Currently there is a known limitation of this revision:"
						echo "- TiLP cannot connect with a TiEmu emulated device."
						echo
						echo "********"
						echo
		EOF
}
