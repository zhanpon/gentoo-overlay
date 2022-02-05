EAPI=8

PYTHON_COMPAT=( python3_{8..9} )

inherit distutils-r1 cmake

DESCRIPTION="Neighborhood Graph and Tree for Indexing High-dimensional Data"
HOMEPAGE="https://github.com/yahoojapan/NGT"

SRC_URI="https://github.com/yahoojapan/NGT/archive/refs/tags/v1.13.7.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="dev-python/pybind11"

PATCHES=(
	"${FILESDIR}"/${P}-cmake-destination.patch
	"${FILESDIR}"/${P}-setup-py.patch
)

do_python() {
	pushd "${S}/python"
	"$@"
	popd
}

src_compile() {
	cmake_src_compile
	do_python distutils-r1_src_compile
}

src_install() {
	cmake_src_install
	do_python distutils-r1_src_install
}
