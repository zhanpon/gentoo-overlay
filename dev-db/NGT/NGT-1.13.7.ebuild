EAPI=8

inherit cmake

DESCRIPTION="Neighborhood Graph and Tree for Indexing High-dimensional Data"
HOMEPAGE="https://github.com/yahoojapan/NGT"

SRC_URI="https://github.com/yahoojapan/NGT/archive/refs/tags/v1.13.7.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

PATCHES=(
	"${FILESDIR}"/${P}-cmake-destination.patch
)
