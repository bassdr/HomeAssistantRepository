# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="MQTT daemon that sends your Hydro-Quebec account information to your MQTT server for consumption by Home-Assistant or other home automation platforms."
HOMEPAGE="https://hydroqc.ca/en/ https://gitlab.com/hydroqc/hydroqc2mqtt https://pypi.org/project/hydroqc2mqtt/"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="+ujson" # "test"
#RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	dev-python/hydroqc[${PYTHON_USEDEP}]
	dev-python/mqtt_hass_base[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	~dev-python/aiomqtt-2.0.0[${PYTHON_USEDEP}]
	dev-python/paho-mqtt[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	ujson? ( dev-python/ujson[${PYTHON_USEDEP}] )
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	|| ( app-misc/homeassistant-min[mqtt,${PYTHON_USEDEP}] app-misc/homeassistant[mqtt,${PYTHON_USEDEP}] app-misc/homeassistant-full[mqtt,${PYTHON_USEDEP}] )
"

#BDEPEND="
#	test? (
#		dev-python/aioresponses[${PYTHON_USEDEP}]
#		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
#		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
#		dev-python/pytest-cov[${PYTHON_USEDEP}]
#		dev-python/pytest-timeout[${PYTHON_USEDEP}]
#	)"

src_prepare() {
	# remove dynamic stuff and force version
	sed 's/dynamic = \[.*\]/version = \"'${PV}'\"/g' -i pyproject.toml || die
	sed 's/, "setuptools-git-versioning<2"//g' -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest
