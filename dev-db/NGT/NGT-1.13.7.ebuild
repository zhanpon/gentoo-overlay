EAPI=8

PYTHON_COMPAT=( python3_{8..9} )

inherit distutils-r1 cmake

DESCRIPTION="Neighborhood Graph and Tree for Indexing High-dimensional Data"
HOMEPAGE="https://github.com/yahoojapan/NGT"

SRC_URI="https://github.com/yahoojapan/NGT/archive/refs/tags/v1.13.7.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
# TODO: static-libs, openmp
IUSE="python"
KEYWORDS="~amd64"

BDEPEND="
	python? ( dev-python/pybind11 )
"

PATCHES=(
	"${FILESDIR}"/${P}-cmake-destination.patch
	"${FILESDIR}"/${P}-setup-py.patch
)

# The style follows sys-libs/libseccomp
do_python() {
	pushd "${S}/python"
	"$@"
	popd
}

src_compile() {
	cmake_src_compile

	if use python; then
		local -x CPPFLAGS="-I\"${BUILD_DIR}/lib\" -I\"${S}/lib\" ${CPPFLAGS}"
		local -x LDFLAGS="-L\"${BUILD_DIR}/lib/NGT\" ${LDFLAGS}"
		do_python distutils-r1_src_compile
	fi
}

src_install() {
	cmake_src_install

	if use python; then
		do_python distutils-r1_src_install
	fi
}
