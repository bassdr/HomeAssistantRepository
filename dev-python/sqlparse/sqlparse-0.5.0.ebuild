# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="A non-validating SQL parser module for Python"
HOMEPAGE="
	https://github.com/andialbrecht/sqlparse/
	https://pypi.org/project/sqlparse/
"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

distutils_enable_sphinx docs/source
distutils_enable_tests pytest