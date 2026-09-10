TERMUX_PKG_HOMEPAGE="https://t3.yaronet.com/?id=19"
TERMUX_PKG_DESCRIPTION="PedroM is an open source Operating System for Ti-68k calculators."
TERMUX_PKG_LICENSE="GPL-2.0-or-later"
TERMUX_PKG_MAINTAINER="3ls-it <3ls-it@pm.me>"
TERMUX_PKG_VERSION="0.83"
TERMUX_PKG_SRCURL="https://t3.yaronet.com/archives/OS/pedrom-${TERMUX_PKG_VERSION}.7z"
TERMUX_PKG_SHA256=64ce547fa208aa1633ac15e15239fa9dbc8e30b9b8000db1e6fe9c5c474c75b2
TERMUX_PKG_AUTO_UPDATE=false
TERMUX_PKG_PLATFORM_INDEPENDENT=true


termux_step_get_source() {
		mkdir -p "$TERMUX_PKG_SRCDIR"
		termux_download "${TERMUX_PKG_SRCURL}" "${TERMUX_PKG_CACHEDIR}/pedrom-${TERMUX_PKG_VERSION}.7z"
}

termux_step_post_get_source() {
		cd "$TERMUX_PKG_SRCDIR"
		bsdtar -xf "$TERMUX_PKG_CACHEDIR"/"pedrom-${TERMUX_PKG_VERSION}.7z"
}

termux_step_configure() {
		:
}

termux_step_make() {
		:
}

termux_step_make_install() {
		local src="$TERMUX_PKG_SRCDIR/pedrom"
		local tiemu_dir="$TERMUX_PREFIX/share/tiemu/pedrom"

		# Make working images available to TiEmu's startup scanner.
		for image in \
				PedroM-89.89u \
				PedroM-89ti.89u \
				PedroM-9x.9xu \
				PedroM-v2.9xu
		do
				install -Dm644 "$src/$image" "$tiemu_dir/$image"
		done
}
