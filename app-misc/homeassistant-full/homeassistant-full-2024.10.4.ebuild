# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_12 )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="homeassistant"
inherit distutils-r1 pypi readme.gentoo-r1 systemd

MY_PN=homeassistant

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/home-assistant/core.git"
	EGIT_BRANCH="dev"
	S="${WORKDIR}/homeassistant-full-9999/"
else
	MY_PV=${PV/_beta/b}
	MY_P=${MY_PN}-${MY_PV}
	SRC_URI="$(pypi_sdist_url homeassistant)
	https://github.com/home-assistant/core/archive/${MY_PV}.tar.gz -> ${MY_P}.gh.tar.gz"
fi

DESCRIPTION="Open-source home automation platform running on Python."
HOMEPAGE="https://home-assistant.io/ https://git.edevau.net/onkelbeh/HomeAssistantRepository/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="abode accuweather acer_projector acmeda adax adguard ads advantage_air aemet aftership agent_dvr airgradient airly airnow airq airthings airtouch4 airtouch5 airvisual airvisual_pro airzone airzone_cloud alarmdecoder alpha_vantage amazon_polly ambee amberelectric ambiclimate ambient_network ambient_station amcrest ampio analytics_insights androidtv androidtv_remote android_ip_webcam anova anthemav aosmith apache_kafka apcupsd apns apple_tv apprise aprilaire aprs apsystems aqualogic aquostv aranet arcam_fmj arlo arris_tg2492lg aruba arve aseko_pool_live assist_pipeline asterisk_mbox asuswrt atag aten_pe atome august aurora aurora_abb_powerone aussie_broadband avea avion awair aws axis azure_data_explorer +backup baf baidu balboa bang_olufsen bbb_gpio bbox beewi_smartclim bh1750 bitcoin bizkaibus blackbird blebox blink blinksticklight blinkt blockchain bluemaestro bluesound +bluetooth bluetooth_le_tracker bluetooth_tracker blue_current bme280 bme680 bmp280 bmw_connected_drive bond bosch_shc braviatv bring broadlink brottsplatskartan brunt bsblan bthome bt_home_hub_5 bt_smarthub buienradar +caldav camera canary cast ccm15 channels circuit cisco_ios cisco_mobility_express clementine cli climacell cloud cloudflare cmus co2signal coinbase color_extractor comelit comfoconnect compensation concord232 control4 coolmaster coronavirus cppm_tracker cpuspeed crownstone cups daikin danfoss_air datadog debugpy deconz decora decora_wifi delijn deluge denonavr deutsche_bahn devialet devolo_home_control devolo_home_network dexcom dhcp dht digitalloggers digital_ocean directv discogs discord discovergy discovery dlib_face_detect dlib_face_identify dlink dlna_dmr dlna_dms dnsip dominos doods doorbird dormakaba_dkey dovado dremel_3d_printer drop_connect dsmr dunehd duotecno dwd_weather_warnings dweet dynalite dyson eafm easyenergy ebox ebusd ecoal_boiler ecobee ecoforest econet ecovacs ecowitt eddystone_temperature edimax edl21 ee_brightbox efergy egardia electrasmart electric_kiwi elgato eliqonline elkm1 elmax elv elvia emby emonitor emulated_hue emulated_kasa emulated_roku energenie_power_sockets energyzero enigma2 enocean enphase_envoy entur_public_transport environment_canada envirophat envisalink ephember epic_games_store epion epson epsonworkforce eq3btsmart escea esphome essent etherscan eufy eufylife_ble everlights evil_genius_labs evohome ezviz faa_delays familyhub fastdotcom feedreader ffmpeg fibaro fido file file_upload fints fireservicerota firmata fitbit fivem fixer fjaraskupan fleetgo flexit flexit_bacnet flic flick_electric flipr flo flume flunearyou flux_led folder_watcher foobot forecast_solar forked_daapd fortios foscam freebox freedompro free_mobile fritz fritzbox fritzbox_callmonitor fronius frontier_silicon fully_kiosk futurenow fyta garages_amsterdam gardena_bluetooth garmin_connect gc100 gdacs generic geniushub geocaching geonetnz_quakes geonetnz_volcano geo_json_events geo_rss_events gios github gitlab_ci gitter glances gntp goalfeed goalzero gogogate2 goodwe google google_assistant_sdk google_cloud google_generative_ai_conversation google_mail google_maps google_pubsub google_sheets google_tasks google_translate google_travel_time govee_ble govee_light_local gpsd gree greeneye_monitor greenwave growatt_server gstreamer gtfs guardian habitica hangouts hardware harman_kardon_avr harmony hdmi_cec heatmiser heos here_travel_time hikvision hikvisioncam hisense_aehw4a1 hive hko hlk_sw16 holiday +homekit homekit_controller homematic homematicip_cloud homewizard homeworks home_connect home_plus_control honeywell horizon hp_ilo html5 http htu21d huawei_lte hue huisbaasje hunterdouglas_powerview husqvarna_automower huum hvv_departures hydrawise hyperion ialarm ialarm_xr iammeter iaqualink ibeacon icloud idasen_desk idteck_prox ifttt iglo ign_sismologia ihc image image_upload imap imgw_pib improv_ble incomfort influxdb inkbird insteon intellifire intesishome iota iotawatt iperf3 ipma ipp iqvia irish_rail_transport isal islamic_prayer_times iss isy994 itach izone jellyfin jewish_calendar joaoapps_join juicenet justnimbus jvc_projector kaiterra kaleidescape keba keenetic_ndms2 kef kegtron keyboard keyboard_remote keymitt_ble kira kiwi kmtronic knx kodi konnected kostal_plenticore kraken kulersky kwb lacrosse lacrosse_view lamarzocco lametric landisgyr_heat_meter lastfm launch_library laundrify lcn ld2410_ble leaone led_ble lg_netcast lg_soundbar lidarr life360 lifx lifx_legacy lightwave limitlessled linear_garage_door linode linux_battery litejet litterrobot livisi local_calendar local_todo logi_circle london_underground lookin loopenergy loqed luci luftdaten lupusec lutron lutron_caseta lw12wifi lyft lyric magicseaweed mailgun +mariadb marytts mastodon matrix +matter maxcube mcp23017 meater medcom_ble mediaroom media_extractor melcloud melissa melnor message_bird met meteoalarm meteoclimatic meteo_france metoffice met_eireann mfi mhz19 microbees microsoft mikrotik mill minecraft_server minio moat +mobile_app mochad modbus modem_callerid modern_forms moehlenhoff_alpha2 monoprice monzo mopeka +mosquitto motionblinds_ble motioneye motionmount motion_blinds mpd +mqtt msteams mullvad mutesync mvglive mychevy mycroft mysensors mysql mystrom mythicbeastsdns myuplink nad nam namecheapdns nanoleaf neato nederlandse_spoorwegen nello ness_alarm nest netatmo netdata netgear netgear_lte netio network neurio_energy nexia nextbus nextcloud nextdns nfandroidtv nibe_heatpump nightscout niko_home_control nilu nina nissan_leaf nmap_tracker nmbs noaa_tides nobo_hub norway_air +notify_events notion nsw_fuel_station nsw_rural_fire_service_feed nuheat nuki numato nut nws nx584 nzbget oasa_telematics obihai octoprint oem ohmconnect ollama ombi omnilogic oncue ondilo_ico onkyo onvif openai_conversation openerz openevse opengarage openhome opensensemap opensky opentherm_gw openuv openweathermap open_meteo opnsense opower opple oralb orangepi_gpio oru orvibo osoenergy osramlightify otbr +otp ourgroceries overkiz ovo_energy owntracks ozw p1_monitor panasonic_bluray panasonic_viera pandora pcal9535a peco pegel_online pencom permobil philips_js picnic piglow pilight +ping pi_hole pjlink plaato +plex plugwise plum_lightpad pocketcasts point poolsense powerwall private_ble_device profiler progettihwsw proliphix prometheus prosegur proxmoxve proxy prusalink ps4 pulseaudio_loopback pure_energie purpleair pushbullet pushover pvoutput pvpc_hourly_pricing +python_script qbittorrent qingping qld_bushfire qnap qnap_qsw qrcode quantum_gateway qvr_pro qwikswitch rabbitair rachio radiotherm radio_browser rainbird raincloud rainforest_eagle rainforest_raven rainmachine rapt_ble raspihats raspyrfm rdw recollect_waste +recorder recswitch reddit refoss rejseplanen remember_the_milk remote_rpi_gpio renault renson reolink repetier +rest rflink rfxtrx ridwell ring ripple risco rituals_perfume_genie rmvtransport rocketchat roku romy roomba roon route53 rova rpi_gpio rpi_gpio_pwm rpi_pfio rpi_power rpi_rf rtsp_to_webrtc ruckus_unleashed russound_rio russound_rnet ruuvitag_ble ruuvi_gateway rympro sabnzbd saj samsungtv sanix satel_integra schlage schluter +scrape screenlogic scsgate season sendgrid sense sensehat senseme sensibo sensirion_ble sensorpro sensorpush sentry senz serial serial_pm sesame seventeentrack seven_segments sfr_box sharkiq shelly shiftr shodan sht31 sia sighthound signal_messenger simplepush simplisafe sinch sisyphus skybeacon skybell sky_hub slack sleepiq slide slimproto sma smappee smarthab smartthings smarttub smarty smart_meter_texas smhi sms snapcast +snmp snooz socat solaredge solaredge_local solarlog solax soma somfy somfy_mylink sonarr songpal sonos sony_projector soundtouch spc speedtestdotnet spider splunk +spotify +sql squeezebox srp_energy ssdp +ssl starline starlingbank starlink startca statsd steamist steam_online stookalert stookwijzer stream streamlabswater subaru suez_water sunweg supla surepetcare swiss_hydrological_data swiss_public_transport switchbee switchbot switchbot_cloud switcher_kis switchmate syncthing syncthru synology_dsm synology_srm systemd systemmonitor system_bridge tado tahoma tailscale tailwind tami4 tankerkoenig tank_utility tapsaff tasmota tautulli technove ted5000 tedee telegram_bot tellduslive tellstick temper tesla tesla_wall_connector teslemetry tessie test tfiac thermobeacon thermopro thermoworks_smoke thingspeak thinkingcleaner thread tibber tikteck tile tilt_ble tmb todoist tof tolo tomorrowio toon totalconnect touchline tplink tplink_lte tplink_omada traccar traccar_server trackr tractive tradfri trafikverket_camera trafikverket_ferry trafikverket_train trafikverket_weatherstation transmission transport_nsw travisci trend tts tuya twentemilieu twilio twinkly twitch twitter ubus ukraine_alarm unifi unifiled unifiprotect unifi_direct upb upcloud upc_connect +upnp uptimerobot usb uscis usgs_earthquakes_feed utility_meter uvc v2c vallox vasttrafik velbus velux venstar vera verisure versasense +version vesync vicare vilfo vivotek vizio vlc vlc_telnet vodafone_station voip volkszaehler volumio volvooncall vulcan vultr w800rf32 +wake_on_lan wallbox waqi waterfurnace watson_iot watson_tts watttime waze_travel_time weatherflow weatherflow_cloud weatherkit webmin webostv wemo whirlpool whois wiffi wilight wink wirelesstag withings wiz wled wolflink workday ws66i xbox xbox_live xeoma xiaomi_aqara xiaomi_ble xiaomi_miio xiaomi_tv xmpp xs1 yalexs_ble yale_smart_alarm yamaha yamaha_musiccast yandex_transport yardian yeelight yeelightsunflower yi yolink youless youtube zabbix zamg zengge zeroconf zerproc zestimate zeversolar zha zhong_hong ziggo_mediabox_xl zoneminder zwave_js zwave_me"
RESTRICT="!test? ( test )"

# external deps
RDEPEND="${PYTHON_DEPS} acct-group/${MY_PN} acct-user/${MY_PN}
	|| ( dev-lang/python:3.12 dev-lang/python:3.13 )
	app-admin/logrotate
	dev-db/sqlite
	dev-libs/libfastjson
	dev-libs/xerces-c"
# make sure no conflicting main Ebuild is installed
RDEPEND="${RDEPEND}
	!app-misc/homeassistant-min
	!app-misc/homeassistant"
REQUIRED_USE="bluetooth? ( ruuvi_gateway shelly )
	homekit_controller? ( bluetooth )"

# Home Assistant Core dependencies from ./core-2024.10.4/homeassistant/package_constraints.txt
RDEPEND="${RDEPEND}
	~dev-python/aiodhcpwatcher-1.0.2[${PYTHON_USEDEP}]
	~dev-python/aiodiscover-2.1.0[${PYTHON_USEDEP}]
	~dev-python/aiodns-3.2.0[${PYTHON_USEDEP}]
	~dev-python/aiohasupervisor-0.1.0[${PYTHON_USEDEP}]
	~dev-python/aiohttp-fast-zlib-0.1.1[${PYTHON_USEDEP}]
	~dev-python/aiohttp-3.10.8[${PYTHON_USEDEP}]
	~dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}]
	~dev-python/aiozoneinfo-0.2.1[${PYTHON_USEDEP}]
	~dev-python/astral-2.2[${PYTHON_USEDEP}]
	~dev-python/async-interrupt-1.2.0[${PYTHON_USEDEP}]
	~dev-python/async-upnp-client-0.40.0[${PYTHON_USEDEP}]
	~dev-python/atomicwrites-1.4.1[${PYTHON_USEDEP}]
	~dev-python/attrs-23.2.0[${PYTHON_USEDEP}]
	~dev-python/awesomeversion-24.6.0[${PYTHON_USEDEP}]
	~dev-python/bcrypt-4.2.0[${PYTHON_USEDEP}]
	~dev-python/bleak-retry-connector-3.5.0[${PYTHON_USEDEP}]
	~dev-python/bleak-0.22.2[${PYTHON_USEDEP}]
	~dev-python/bluetooth-adapters-0.19.4[${PYTHON_USEDEP}]
	~dev-python/bluetooth-auto-recovery-1.4.2[${PYTHON_USEDEP}]
	~dev-python/bluetooth-data-tools-1.20.0[${PYTHON_USEDEP}]
	~dev-python/cached-ipaddress-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2021.5.30[${PYTHON_USEDEP}]
	~dev-python/ciso8601-2.3.1[${PYTHON_USEDEP}]
	~dev-python/cryptography-43.0.1[${PYTHON_USEDEP}]
	~dev-python/dbus-fast-2.24.0[${PYTHON_USEDEP}]
	~dev-python/fnv-hash-fast-1.0.2[${PYTHON_USEDEP}]
	~dev-python/ha-av-10.1.1[${PYTHON_USEDEP}]
	~dev-python/ha-ffmpeg-3.2.0[${PYTHON_USEDEP}]
	~dev-python/habluetooth-3.4.0[${PYTHON_USEDEP}]
	~dev-python/hass-nabucasa-0.81.1[${PYTHON_USEDEP}]
	~dev-python/hassil-1.7.4[${PYTHON_USEDEP}]
	~dev-python/home-assistant-bluetooth-1.13.0[${PYTHON_USEDEP}]
	~dev-python/home-assistant-frontend-20241002.4[${PYTHON_USEDEP}]
	~dev-python/home-assistant-intents-2024.10.2[${PYTHON_USEDEP}]
	~dev-python/httpx-0.27.2[${PYTHON_USEDEP}]
	~dev-python/ifaddr-0.2.0[${PYTHON_USEDEP}]
	~dev-python/jinja-3.1.4[${PYTHON_USEDEP}]
	~dev-python/lru-dict-1.3.0[${PYTHON_USEDEP}]
	~media-libs/mutagen-1.47.0[${PYTHON_USEDEP}]
	~dev-python/orjson-3.10.7[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.1[${PYTHON_USEDEP}]
	~dev-python/paho-mqtt-1.6.1[${PYTHON_USEDEP}]
	~dev-python/pillow-10.4.0[${PYTHON_USEDEP}]
	~dev-python/psutil-home-assistant-0.0.1[${PYTHON_USEDEP}]
	~dev-python/pyjwt-2.9.0[${PYTHON_USEDEP}]
	~dev-python/pymicro-vad-1.0.1[${PYTHON_USEDEP}]
	~dev-python/pynacl-1.5.0[${PYTHON_USEDEP}]
	~dev-python/pyopenssl-24.2.1[${PYTHON_USEDEP}]
	~dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	~dev-python/pyspeex-noise-1.0.2[${PYTHON_USEDEP}]
	~dev-python/python-slugify-8.0.4[${PYTHON_USEDEP}]
	~dev-python/PyTurboJPEG-1.7.5[${PYTHON_USEDEP}]
	~dev-python/pyudev-0.24.1[${PYTHON_USEDEP}]
	~dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
	~dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	~dev-python/sqlalchemy-2.0.31[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}]
	~dev-python/ulid-transform-1.0.2[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.5[${PYTHON_USEDEP}]
	>=dev-python/uv-0.4.15
	~dev-python/voluptuous-openapi-0.0.5[${PYTHON_USEDEP}]
	~dev-python/voluptuous-serialize-2.6.0[${PYTHON_USEDEP}]
	~dev-python/voluptuous-0.15.2[${PYTHON_USEDEP}]
	~dev-python/yarl-1.13.1[${PYTHON_USEDEP}]
	~dev-python/zeroconf-0.135.0[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.6.6[${PYTHON_USEDEP}]
	>=dev-python/httplib2-0.19.0[${PYTHON_USEDEP}]
	~dev-python/grpcio-1.59.0[${PYTHON_USEDEP}]
	~dev-python/grpcio-status-1.59.0[${PYTHON_USEDEP}]
	~dev-python/grpcio-reflection-1.59.0[${PYTHON_USEDEP}]
        dev-python/cchardet[${PYTHON_USEDEP}]
	>=dev-python/btlewrap-0.0.10[${PYTHON_USEDEP}]
	~dev-python/anyio-4.6.0[${PYTHON_USEDEP}]
	~dev-python/h11-0.14.0[${PYTHON_USEDEP}]
	~dev-python/httpcore-1.0.5[${PYTHON_USEDEP}]
	>=dev-python/hyperframe-5.2.0[${PYTHON_USEDEP}]
	~dev-python/numpy-1.26.4[${PYTHON_USEDEP}]
	>=dev-python/multidict-6.0.2[${PYTHON_USEDEP}]
	>=dev-python/backoff-2.0[${PYTHON_USEDEP}]
	~dev-python/pydantic-1.10.17[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.13.1[${PYTHON_USEDEP}]
	!=dev-python/pubnub-6.4.0[${PYTHON_USEDEP}]
	!=dev-python/iso4217-1.10.20220401[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-24.0.0[${PYTHON_USEDEP}]
	~dev-python/protobuf-python-4.25.4[${PYTHON_USEDEP}]
	>=dev-python/cchardet-2.1.18[${PYTHON_USEDEP}]
	>=dev-python/websockets-11.0.1[${PYTHON_USEDEP}]
	~dev-python/charset-normalizer-3.2.0[${PYTHON_USEDEP}]
	>=dev-python/dacite-1.7.0[${PYTHON_USEDEP}]
	>=dev-python/chacha20poly1305-reuseable-0.13.0[${PYTHON_USEDEP}]
	>=dev-python/pycountry-23.12.11[${PYTHON_USEDEP}]
	>=net-analyzer/scapy-2.5.0[${PYTHON_USEDEP}]
	>=dev-python/tuf-4.0.0[${PYTHON_USEDEP}]
	!=dev-python/tenacity-8.4.0[${PYTHON_USEDEP}]
"
# Home Assistant Core dependencies from ./homeassistant-2024.10.4/homeassistant/package_constraints.txt
RDEPEND="${RDEPEND}
	~dev-python/aiodhcpwatcher-1.0.2[${PYTHON_USEDEP}]
	~dev-python/aiodiscover-2.1.0[${PYTHON_USEDEP}]
	~dev-python/aiodns-3.2.0[${PYTHON_USEDEP}]
	~dev-python/aiohasupervisor-0.1.0[${PYTHON_USEDEP}]
	~dev-python/aiohttp-fast-zlib-0.1.1[${PYTHON_USEDEP}]
	~dev-python/aiohttp-3.10.8[${PYTHON_USEDEP}]
	~dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}]
	~dev-python/aiozoneinfo-0.2.1[${PYTHON_USEDEP}]
	~dev-python/astral-2.2[${PYTHON_USEDEP}]
	~dev-python/async-interrupt-1.2.0[${PYTHON_USEDEP}]
	~dev-python/async-upnp-client-0.40.0[${PYTHON_USEDEP}]
	~dev-python/atomicwrites-1.4.1[${PYTHON_USEDEP}]
	~dev-python/attrs-23.2.0[${PYTHON_USEDEP}]
	~dev-python/awesomeversion-24.6.0[${PYTHON_USEDEP}]
	~dev-python/bcrypt-4.2.0[${PYTHON_USEDEP}]
	~dev-python/bleak-retry-connector-3.5.0[${PYTHON_USEDEP}]
	~dev-python/bleak-0.22.2[${PYTHON_USEDEP}]
	~dev-python/bluetooth-adapters-0.19.4[${PYTHON_USEDEP}]
	~dev-python/bluetooth-auto-recovery-1.4.2[${PYTHON_USEDEP}]
	~dev-python/bluetooth-data-tools-1.20.0[${PYTHON_USEDEP}]
	~dev-python/cached-ipaddress-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2021.5.30[${PYTHON_USEDEP}]
	~dev-python/ciso8601-2.3.1[${PYTHON_USEDEP}]
	~dev-python/cryptography-43.0.1[${PYTHON_USEDEP}]
	~dev-python/dbus-fast-2.24.0[${PYTHON_USEDEP}]
	~dev-python/fnv-hash-fast-1.0.2[${PYTHON_USEDEP}]
	~dev-python/ha-av-10.1.1[${PYTHON_USEDEP}]
	~dev-python/ha-ffmpeg-3.2.0[${PYTHON_USEDEP}]
	~dev-python/habluetooth-3.4.0[${PYTHON_USEDEP}]
	~dev-python/hass-nabucasa-0.81.1[${PYTHON_USEDEP}]
	~dev-python/hassil-1.7.4[${PYTHON_USEDEP}]
	~dev-python/home-assistant-bluetooth-1.13.0[${PYTHON_USEDEP}]
	~dev-python/home-assistant-frontend-20241002.4[${PYTHON_USEDEP}]
	~dev-python/home-assistant-intents-2024.10.2[${PYTHON_USEDEP}]
	~dev-python/httpx-0.27.2[${PYTHON_USEDEP}]
	~dev-python/ifaddr-0.2.0[${PYTHON_USEDEP}]
	~dev-python/jinja-3.1.4[${PYTHON_USEDEP}]
	~dev-python/lru-dict-1.3.0[${PYTHON_USEDEP}]
	~media-libs/mutagen-1.47.0[${PYTHON_USEDEP}]
	~dev-python/orjson-3.10.7[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.1[${PYTHON_USEDEP}]
	~dev-python/paho-mqtt-1.6.1[${PYTHON_USEDEP}]
	~dev-python/pillow-10.4.0[${PYTHON_USEDEP}]
	~dev-python/psutil-home-assistant-0.0.1[${PYTHON_USEDEP}]
	~dev-python/pyjwt-2.9.0[${PYTHON_USEDEP}]
	~dev-python/pymicro-vad-1.0.1[${PYTHON_USEDEP}]
	~dev-python/pynacl-1.5.0[${PYTHON_USEDEP}]
	~dev-python/pyopenssl-24.2.1[${PYTHON_USEDEP}]
	~dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	~dev-python/pyspeex-noise-1.0.2[${PYTHON_USEDEP}]
	~dev-python/python-slugify-8.0.4[${PYTHON_USEDEP}]
	~dev-python/PyTurboJPEG-1.7.5[${PYTHON_USEDEP}]
	~dev-python/pyudev-0.24.1[${PYTHON_USEDEP}]
	~dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
	~dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	~dev-python/sqlalchemy-2.0.31[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}]
	~dev-python/ulid-transform-1.0.2[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.5[${PYTHON_USEDEP}]
	>=dev-python/uv-0.4.15
	~dev-python/voluptuous-openapi-0.0.5[${PYTHON_USEDEP}]
	~dev-python/voluptuous-serialize-2.6.0[${PYTHON_USEDEP}]
	~dev-python/voluptuous-0.15.2[${PYTHON_USEDEP}]
	~dev-python/yarl-1.13.1[${PYTHON_USEDEP}]
	~dev-python/zeroconf-0.135.0[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.6.6[${PYTHON_USEDEP}]
	>=dev-python/httplib2-0.19.0[${PYTHON_USEDEP}]
	~dev-python/grpcio-1.59.0[${PYTHON_USEDEP}]
	~dev-python/grpcio-status-1.59.0[${PYTHON_USEDEP}]
	~dev-python/grpcio-reflection-1.59.0[${PYTHON_USEDEP}]
        dev-python/cchardet[${PYTHON_USEDEP}]
	>=dev-python/btlewrap-0.0.10[${PYTHON_USEDEP}]
	~dev-python/anyio-4.6.0[${PYTHON_USEDEP}]
	~dev-python/h11-0.14.0[${PYTHON_USEDEP}]
	~dev-python/httpcore-1.0.5[${PYTHON_USEDEP}]
	>=dev-python/hyperframe-5.2.0[${PYTHON_USEDEP}]
	~dev-python/numpy-1.26.4[${PYTHON_USEDEP}]
	>=dev-python/multidict-6.0.2[${PYTHON_USEDEP}]
	>=dev-python/backoff-2.0[${PYTHON_USEDEP}]
	~dev-python/pydantic-1.10.17[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.13.1[${PYTHON_USEDEP}]
	!=dev-python/pubnub-6.4.0[${PYTHON_USEDEP}]
	!=dev-python/iso4217-1.10.20220401[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-24.0.0[${PYTHON_USEDEP}]
	~dev-python/protobuf-python-4.25.4[${PYTHON_USEDEP}]
	>=dev-python/cchardet-2.1.18[${PYTHON_USEDEP}]
	>=dev-python/websockets-11.0.1[${PYTHON_USEDEP}]
	~dev-python/charset-normalizer-3.2.0[${PYTHON_USEDEP}]
	>=dev-python/dacite-1.7.0[${PYTHON_USEDEP}]
	>=dev-python/chacha20poly1305-reuseable-0.13.0[${PYTHON_USEDEP}]
	>=dev-python/pycountry-23.12.11[${PYTHON_USEDEP}]
	>=net-analyzer/scapy-2.5.0[${PYTHON_USEDEP}]
	>=dev-python/tuf-4.0.0[${PYTHON_USEDEP}]
	!=dev-python/tenacity-8.4.0[${PYTHON_USEDEP}]
"

# unknown origin, still something to clean up here

RDEPEND="${RDEPEND}
	~dev-python/colorlog-6.8.2[${PYTHON_USEDEP}]
	~dev-python/pyotp-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/pyqrcode-1.2.1[${PYTHON_USEDEP}]"

# Module requirements from useflags
RDEPEND="${RDEPEND}
	ambiclimate? ( dev-python/Ambiclimate[${PYTHON_USEDEP}] )
	bh1750? ( dev-python/i2csense[${PYTHON_USEDEP}] )
	blinksticklight? ( ~dev-python/BlinkStick-1.2.0[${PYTHON_USEDEP}] )
	blinkt? ( ~dev-python/blinkt-0.1.0[${PYTHON_USEDEP}] )
	bme280? ( dev-python/i2csense[${PYTHON_USEDEP}] dev-python/bme280spi[${PYTHON_USEDEP}] )
	bme680? ( dev-python/bme680[${PYTHON_USEDEP}] )
	cli? ( app-misc/home-assistant-cli )
	coronavirus? ( dev-python/coronavirus[${PYTHON_USEDEP}] )
	deutsche_bahn? ( dev-python/schiene[${PYTHON_USEDEP}] )
	dht? ( ~dev-python/adafruit-circuitpython-dht-3.7.0[${PYTHON_USEDEP}] ~dev-python/RPi-GPIO-0.7.1_alpha4[${PYTHON_USEDEP}] )
	http? ( ~dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}] ~dev-python/aiohttp-fast-url-dispatcher-0.3.0[${PYTHON_USEDEP}] ~dev-python/aiohttp-zlib-ng-0.3.1[${PYTHON_USEDEP}] )
	loopenergy? ( ~dev-python/pyloopenergy-0.2.1[${PYTHON_USEDEP}] )
	mariadb? ( dev-python/mysqlclient[${PYTHON_USEDEP}] )
	mosquitto? ( app-misc/mosquitto )
	mysql? ( dev-python/mysqlclient[${PYTHON_USEDEP}] )
	smarthab? ( ~dev-python/SmartHab-0.21[${PYTHON_USEDEP}] )
	socat? ( net-misc/socat )
	somfy? ( ~dev-python/pymfy-0.11.0[${PYTHON_USEDEP}] )
	ssl? ( dev-libs/openssl app-crypt/certbot net-proxy/haproxy )
	tesla? ( ~dev-python/teslajsonpy-0.18.3[${PYTHON_USEDEP}] )
	wink? ( ~dev-python/pubnubsub-handler-1.0.9[${PYTHON_USEDEP}] ~dev-python/python-wink-1.10.5[${PYTHON_USEDEP}] )
	abode? ( ~dev-python/jaraco-abode-6.2.1[${PYTHON_USEDEP}] )
	accuweather? ( ~dev-python/accuweather-3.0.0[${PYTHON_USEDEP}] )
	acer_projector? ( ~dev-python/pyserial-3.5[${PYTHON_USEDEP}] )
	acmeda? ( ~dev-python/aiopulse-0.4.6[${PYTHON_USEDEP}] )
	adax? ( ~dev-python/Adax-local-0.1.5[${PYTHON_USEDEP}] ~dev-python/adax-0.4.0[${PYTHON_USEDEP}] )
	adguard? ( ~dev-python/adguardhome-0.7.0[${PYTHON_USEDEP}] )
	ads? ( ~dev-python/pyads-3.4.0[${PYTHON_USEDEP}] )
	advantage_air? ( ~dev-python/advantage-air-0.4.4[${PYTHON_USEDEP}] )
	aemet? ( ~dev-python/AEMET-OpenData-0.5.4[${PYTHON_USEDEP}] )
	aftership? ( ~dev-python/pyaftership-21.11.0[${PYTHON_USEDEP}] )
	agent_dvr? ( ~dev-python/agent-py-0.0.23[${PYTHON_USEDEP}] )
	airgradient? ( ~dev-python/airgradient-0.9.1[${PYTHON_USEDEP}] )
	airly? ( ~dev-python/airly-1.1.0[${PYTHON_USEDEP}] )
	airnow? ( ~dev-python/pyairnow-1.2.1[${PYTHON_USEDEP}] )
	airq? ( ~dev-python/aioairq-0.3.2[${PYTHON_USEDEP}] )
	airthings? ( ~dev-python/airthings-cloud-0.2.0[${PYTHON_USEDEP}] )
	airtouch4? ( ~dev-python/airtouch4pyapi-1.0.5[${PYTHON_USEDEP}] )
	airtouch5? ( ~dev-python/airtouch5py-0.2.10[${PYTHON_USEDEP}] )
	airvisual? ( ~dev-python/pyairvisual-2023.8.1[${PYTHON_USEDEP}] )
	airvisual_pro? ( ~dev-python/pyairvisual-2023.8.1[${PYTHON_USEDEP}] )
	airzone? ( ~dev-python/aioairzone-0.9.5[${PYTHON_USEDEP}] )
	airzone_cloud? ( ~dev-python/aioairzone-cloud-0.6.6[${PYTHON_USEDEP}] )
	alarmdecoder? ( ~dev-python/adext-0.4.3[${PYTHON_USEDEP}] )
	alpha_vantage? ( ~dev-python/alpha-vantage-2.3.1[${PYTHON_USEDEP}] )
	amazon_polly? ( ~dev-python/boto3-1.34.131[${PYTHON_USEDEP}] )
	amberelectric? ( ~dev-python/amberelectric-1.1.1[${PYTHON_USEDEP}] )
	ambient_network? ( ~dev-python/aioambient-2024.8.0[${PYTHON_USEDEP}] )
	ambient_station? ( ~dev-python/aioambient-2024.8.0[${PYTHON_USEDEP}] )
	amcrest? ( ~dev-python/amcrest-1.9.8[${PYTHON_USEDEP}] )
	ampio? ( ~dev-python/asmog-0.0.6[${PYTHON_USEDEP}] )
	analytics_insights? ( ~dev-python/python-homeassistant-analytics-0.7.0[${PYTHON_USEDEP}] )
	androidtv? ( ~dev-python/adb-shell-0.4.4[async,${PYTHON_USEDEP}] ~dev-python/androidtv-0.0.73[async,${PYTHON_USEDEP}] ~dev-python/pure-python-adb-0.3.0-r0[async,${PYTHON_USEDEP}] )
	androidtv_remote? ( ~dev-python/androidtvremote2-0.1.2[${PYTHON_USEDEP}] )
	android_ip_webcam? ( ~dev-python/pydroid-ipcam-2.0.0[${PYTHON_USEDEP}] )
	anova? ( ~dev-python/anova-wifi-0.17.0[${PYTHON_USEDEP}] )
	anthemav? ( ~dev-python/anthemav-1.4.1[${PYTHON_USEDEP}] )
	aosmith? ( ~dev-python/py-aosmith-1.0.8[${PYTHON_USEDEP}] )
	apache_kafka? ( ~dev-python/aiokafka-0.10.0[${PYTHON_USEDEP}] )
	apcupsd? ( ~dev-python/aioapcaccess-0.4.2[${PYTHON_USEDEP}] )
	apple_tv? ( ~dev-python/pyatv-0.15.1[${PYTHON_USEDEP}] )
	apprise? ( ~dev-python/apprise-1.8.0[${PYTHON_USEDEP}] )
	aprilaire? ( ~dev-python/pyaprilaire-0.7.4[${PYTHON_USEDEP}] )
	aprs? ( ~dev-python/aprslib-0.7.2[${PYTHON_USEDEP}] ~sci-geosciences/geopy-2.3.0[${PYTHON_USEDEP}] )
	apsystems? ( ~dev-python/apsystems-ez1-2.2.1[${PYTHON_USEDEP}] )
	aqualogic? ( ~dev-python/aqualogic-2.6[${PYTHON_USEDEP}] )
	aquostv? ( ~dev-python/sharp_aquos_rc-0.3.2[${PYTHON_USEDEP}] )
	aranet? ( ~dev-python/aranet4-2.4.0[${PYTHON_USEDEP}] )
	arcam_fmj? ( ~dev-python/arcam-fmj-1.5.2[${PYTHON_USEDEP}] )
	arris_tg2492lg? ( ~dev-python/arris-tg2492lg-2.2.0[${PYTHON_USEDEP}] )
	aruba? ( ~dev-python/pexpect-4.6.0[${PYTHON_USEDEP}] )
	arve? ( ~dev-python/asyncarve-0.1.1[${PYTHON_USEDEP}] )
	aseko_pool_live? ( ~dev-python/aioaseko-1.0.0[${PYTHON_USEDEP}] )
	assist_pipeline? ( ~dev-python/pymicro-vad-1.0.1[${PYTHON_USEDEP}] ~dev-python/pyspeex-noise-1.0.2[${PYTHON_USEDEP}] )
	asuswrt? ( ~dev-python/aioasuswrt-1.4.0[${PYTHON_USEDEP}] ~dev-python/pyasuswrt-0.1.21[${PYTHON_USEDEP}] )
	atag? ( ~dev-python/pyatag-0.3.5.3[${PYTHON_USEDEP}] )
	aten_pe? ( ~dev-python/auroranoaa-0.0.3[${PYTHON_USEDEP}] )
	atome? ( ~dev-python/pyAtome-0.1.1[${PYTHON_USEDEP}] )
	august? ( ~dev-python/yalexs-ble-2.4.3[${PYTHON_USEDEP}] ~dev-python/yalexs-8.6.4[${PYTHON_USEDEP}] )
	aurora? ( ~dev-python/auroranoaa-0.0.3[${PYTHON_USEDEP}] )
	aurora_abb_powerone? ( ~dev-python/aurorapy-0.2.7[${PYTHON_USEDEP}] )
	aussie_broadband? ( ~dev-python/pyaussiebb-0.0.15[${PYTHON_USEDEP}] )
	avea? ( ~dev-python/axis-62[${PYTHON_USEDEP}] )
	avion? ( ~dev-python/axis-62[${PYTHON_USEDEP}] )
	awair? ( ~dev-python/python-awair-0.2.4[${PYTHON_USEDEP}] )
	aws? ( ~dev-python/aiobotocore-2.13.1[${PYTHON_USEDEP}] ~dev-python/botocore-1.34.131[${PYTHON_USEDEP}] )
	axis? ( ~dev-python/axis-62[${PYTHON_USEDEP}] )
	azure_data_explorer? ( ~dev-python/azure-kusto-data-4.5.1[aio,${PYTHON_USEDEP}] ~dev-python/azure-kusto-ingest-4.5.1[${PYTHON_USEDEP}] )
	backup? ( ~dev-python/securetar-2024.2.1[${PYTHON_USEDEP}] )
	baf? ( ~dev-python/aiobafi6-0.9.0[${PYTHON_USEDEP}] )
	baidu? ( ~dev-python/baidu-aip-1.6.6.0[${PYTHON_USEDEP}] )
	balboa? ( ~dev-python/pybalboa-1.0.2[${PYTHON_USEDEP}] )
	bang_olufsen? ( ~dev-python/mozart-api-3.4.1.8.8[${PYTHON_USEDEP}] )
	bbox? ( ~dev-python/pybbox-0.0.5_alpha0[${PYTHON_USEDEP}] )
	beewi_smartclim? ( ~dev-python/bimmer-connected-0.16.3[china,${PYTHON_USEDEP}] )
	bitcoin? ( ~dev-python/blockchain-1.4.4[${PYTHON_USEDEP}] )
	bizkaibus? ( ~dev-python/bizkaibus-0.1.1[${PYTHON_USEDEP}] )
	blackbird? ( ~dev-python/pyblackbird-0.6[${PYTHON_USEDEP}] )
	blebox? ( ~dev-python/blebox-uniapi-2.5.0[${PYTHON_USEDEP}] )
	blink? ( ~dev-python/blinkpy-0.23.0[${PYTHON_USEDEP}] )
	blockchain? ( ~dev-python/python-blockchain-api-0.0.2[${PYTHON_USEDEP}] )
	bluemaestro? ( ~dev-python/bluemaestro-ble-0.2.3[${PYTHON_USEDEP}] )
	bluesound? ( ~dev-python/pyblu-1.0.4[${PYTHON_USEDEP}] )
	bluetooth? ( ~dev-python/bleak-retry-connector-3.5.0[${PYTHON_USEDEP}] ~dev-python/bleak-0.22.2[${PYTHON_USEDEP}] ~dev-python/bluetooth-adapters-0.19.4[${PYTHON_USEDEP}] ~dev-python/bluetooth-auto-recovery-1.4.2[${PYTHON_USEDEP}] ~dev-python/bluetooth-data-tools-1.20.0[${PYTHON_USEDEP}] ~dev-python/dbus-fast-2.24.0[${PYTHON_USEDEP}] ~dev-python/habluetooth-3.4.0[${PYTHON_USEDEP}] )
	bluetooth_tracker? ( ~dev-python/pychromecast-14.0.3[${PYTHON_USEDEP}] ~dev-python/bt-proximity-0.2.1[${PYTHON_USEDEP}] )
	blue_current? ( ~dev-python/bluecurrent-api-1.2.3[${PYTHON_USEDEP}] )
	bmw_connected_drive? ( ~dev-python/bimmer-connected-0.16.3[china,${PYTHON_USEDEP}] )
	bond? ( ~dev-python/bond-async-0.2.1[${PYTHON_USEDEP}] )
	bosch_shc? ( ~dev-python/boschshcpy-0.2.91[${PYTHON_USEDEP}] )
	braviatv? ( ~dev-python/pybravia-0.3.4[${PYTHON_USEDEP}] )
	bring? ( ~dev-python/bring-api-0.9.0[${PYTHON_USEDEP}] )
	broadlink? ( ~dev-python/broadlink-0.19.0[${PYTHON_USEDEP}] )
	brottsplatskartan? ( ~dev-python/brottsplatskartan-1.0.5[${PYTHON_USEDEP}] )
	brunt? ( ~dev-python/brunt-1.2.0[${PYTHON_USEDEP}] )
	bsblan? ( ~dev-python/python-bsblan-0.6.2[${PYTHON_USEDEP}] )
	bthome? ( ~dev-python/bthome-ble-3.9.1[${PYTHON_USEDEP}] )
	bt_home_hub_5? ( ~dev-python/bthomehub5-devicelist-0.1.1[${PYTHON_USEDEP}] )
	bt_smarthub? ( ~dev-python/btsmarthub-devicelist-0.2.3[${PYTHON_USEDEP}] )
	buienradar? ( ~dev-python/buienradar-1.0.6[${PYTHON_USEDEP}] )
	caldav? ( ~dev-python/caldav-1.3.9[${PYTHON_USEDEP}] )
	camera? ( ~dev-python/PyTurboJPEG-1.7.5[${PYTHON_USEDEP}] )
	canary? ( ~dev-python/py-canary-0.5.4[${PYTHON_USEDEP}] )
	cast? ( ~dev-python/pychromecast-14.0.3[${PYTHON_USEDEP}] )
	ccm15? ( ~dev-python/py-ccm15-0.0.9[${PYTHON_USEDEP}] )
	channels? ( ~dev-python/pychannels-1.2.3[${PYTHON_USEDEP}] )
	cisco_ios? ( ~dev-python/pexpect-4.6.0[${PYTHON_USEDEP}] )
	cisco_mobility_express? ( ~dev-python/ciscomobilityexpress-0.3.9[${PYTHON_USEDEP}] )
	clementine? ( ~dev-python/python-clementine-remote-1.0.1[${PYTHON_USEDEP}] )
	cloud? ( ~dev-python/hass-nabucasa-0.81.1[${PYTHON_USEDEP}] )
	cloudflare? ( ~dev-python/pycfdns-3.0.0[${PYTHON_USEDEP}] )
	cmus? ( ~dev-python/pycmus-0.1.1[${PYTHON_USEDEP}] )
	co2signal? ( ~dev-python/aioelectricitymaps-0.4.0[${PYTHON_USEDEP}] )
	coinbase? ( ~dev-python/coinbase-advanced-py-1.2.2[${PYTHON_USEDEP}] ~dev-python/coinbase-2.1.0[${PYTHON_USEDEP}] )
	color_extractor? ( ~dev-python/colorthief-0.2.1[${PYTHON_USEDEP}] )
	comelit? ( ~dev-python/aiocomelit-0.9.0[${PYTHON_USEDEP}] )
	comfoconnect? ( ~dev-python/pycomfoconnect-0.5.1[${PYTHON_USEDEP}] )
	compensation? ( ~dev-python/numpy-1.26.4[${PYTHON_USEDEP}] )
	concord232? ( ~dev-python/concord232-0.15.1[${PYTHON_USEDEP}] )
	control4? ( ~dev-python/pyControl4-1.2.0[${PYTHON_USEDEP}] )
	coolmaster? ( ~dev-python/pycoolmasternet-async-0.2.2[${PYTHON_USEDEP}] )
	cppm_tracker? ( ~dev-python/clearpasspy-1.0.2[${PYTHON_USEDEP}] )
	cpuspeed? ( ~dev-python/py-cpuinfo-9.0.0[${PYTHON_USEDEP}] )
	crownstone? ( ~dev-python/crownstone-cloud-1.4.11[${PYTHON_USEDEP}] ~dev-python/crownstone-sse-2.0.5[${PYTHON_USEDEP}] ~dev-python/crownstone-uart-2.1.0[${PYTHON_USEDEP}] ~dev-python/pyserial-3.5[${PYTHON_USEDEP}] )
	cups? ( ~dev-python/pydaikin-2.13.7[${PYTHON_USEDEP}] )
	daikin? ( ~dev-python/pydaikin-2.13.7[${PYTHON_USEDEP}] )
	danfoss_air? ( ~dev-python/pydanfossair-0.1.0[${PYTHON_USEDEP}] )
	datadog? ( ~dev-python/datadog-0.15.0[${PYTHON_USEDEP}] )
	debugpy? ( ~dev-python/debugpy-1.8.1[${PYTHON_USEDEP}] )
	deconz? ( ~dev-python/pydeconz-116[${PYTHON_USEDEP}] )
	decora? ( ~dev-python/bluetooth-adapters-0.19.4[${PYTHON_USEDEP}] ~dev-python/deebot-client-8.4.0[${PYTHON_USEDEP}] )
	decora_wifi? ( ~dev-python/deebot-client-8.4.0[${PYTHON_USEDEP}] )
	delijn? ( ~dev-python/pydelijn-1.1.0[${PYTHON_USEDEP}] )
	deluge? ( ~dev-python/deluge-client-1.10.2[${PYTHON_USEDEP}] )
	denonavr? ( ~dev-python/denonavr-1.0.0[${PYTHON_USEDEP}] )
	devialet? ( ~dev-python/devialet-1.4.5[${PYTHON_USEDEP}] )
	devolo_home_control? ( ~dev-python/devolo-home-control-api-0.18.3[${PYTHON_USEDEP}] )
	devolo_home_network? ( ~dev-python/devolo-plc-api-1.4.1[${PYTHON_USEDEP}] )
	dexcom? ( ~dev-python/pydexcom-0.2.3[${PYTHON_USEDEP}] )
	dhcp? ( ~dev-python/aiodhcpwatcher-1.0.2[${PYTHON_USEDEP}] ~dev-python/aiodiscover-2.1.0[${PYTHON_USEDEP}] ~dev-python/cached-ipaddress-0.6.0[${PYTHON_USEDEP}] )
	digital_ocean? ( ~dev-python/python-digitalocean-1.13.2[${PYTHON_USEDEP}] )
	directv? ( ~dev-python/directv-0.4.0[${PYTHON_USEDEP}] )
	discogs? ( ~dev-python/discogs-client-2.3.0[${PYTHON_USEDEP}] )
	discord? ( ~dev-python/nextcord-2.6.0[${PYTHON_USEDEP}] )
	discovergy? ( ~dev-python/pydiscovergy-3.0.2[${PYTHON_USEDEP}] )
	dlib_face_detect? ( ~dev-python/fastdotcom-0.0.3[${PYTHON_USEDEP}] )
	dlib_face_identify? ( ~dev-python/fastdotcom-0.0.3[${PYTHON_USEDEP}] )
	dlink? ( ~dev-python/pyW215-0.7.0[${PYTHON_USEDEP}] )
	dlna_dmr? ( ~dev-python/async-upnp-client-0.40.0[${PYTHON_USEDEP}] ~dev-python/getmac-0.9.4[${PYTHON_USEDEP}] )
	dlna_dms? ( ~dev-python/async-upnp-client-0.40.0[${PYTHON_USEDEP}] )
	dnsip? ( ~dev-python/aiodns-3.2.0[${PYTHON_USEDEP}] )
	dominos? ( ~dev-python/pizzapi-0.0.6[${PYTHON_USEDEP}] )
	doods? ( ~dev-python/pillow-10.4.0[${PYTHON_USEDEP}] ~dev-python/pydoods-1.0.2[${PYTHON_USEDEP}] )
	doorbird? ( ~dev-python/DoorBirdPy-3.0.4[${PYTHON_USEDEP}] )
	dormakaba_dkey? ( ~dev-python/py-dormakaba-dkey-1.0.5[${PYTHON_USEDEP}] )
	dremel_3d_printer? ( ~dev-python/dremel3dpy-2.1.1[${PYTHON_USEDEP}] )
	drop_connect? ( ~dev-python/dropmqttapi-1.0.3[${PYTHON_USEDEP}] )
	dsmr? ( ~dev-python/dsmr-parser-1.4.2[${PYTHON_USEDEP}] )
	dunehd? ( ~dev-python/pdunehd-1.3.2[${PYTHON_USEDEP}] )
	duotecno? ( ~dev-python/pyDuotecno-2024.10.1[${PYTHON_USEDEP}] )
	dwd_weather_warnings? ( ~dev-python/dwdwfsapi-1.0.7[${PYTHON_USEDEP}] )
	dweet? ( ~dev-python/dweepy-0.3.0[${PYTHON_USEDEP}] )
	dynalite? ( ~dev-python/dynalite-devices-0.1.47[${PYTHON_USEDEP}] ~dev-python/dynalite-panel-0.0.4[${PYTHON_USEDEP}] )
	eafm? ( ~dev-python/aioeafm-0.1.2[${PYTHON_USEDEP}] )
	easyenergy? ( ~dev-python/easyenergy-2.1.2[${PYTHON_USEDEP}] )
	ebox? ( ~dev-python/pyebox-1.1.4[${PYTHON_USEDEP}] )
	ebusd? ( ~dev-python/ebusdpy-0.0.17[${PYTHON_USEDEP}] )
	ecoal_boiler? ( ~dev-python/ecoaliface-0.4.0[${PYTHON_USEDEP}] )
	ecobee? ( ~dev-python/python-ecobee-api-0.2.18[${PYTHON_USEDEP}] )
	ecoforest? ( ~dev-python/pyecoforest-0.4.0[${PYTHON_USEDEP}] )
	econet? ( ~dev-python/pyeconet-0.1.23[${PYTHON_USEDEP}] )
	ecovacs? ( ~dev-python/deebot-client-8.4.0[${PYTHON_USEDEP}] ~dev-python/py-sucks-0.9.10[${PYTHON_USEDEP}] )
	ecowitt? ( ~dev-python/aioecowitt-2024.2.1[${PYTHON_USEDEP}] )
	eddystone_temperature? ( ~dev-python/beautifulsoup4-4.12.3[${PYTHON_USEDEP}] )
	edimax? ( ~dev-python/pyedimax-0.2.1[${PYTHON_USEDEP}] )
	edl21? ( ~dev-python/pysml-0.0.12[${PYTHON_USEDEP}] )
	efergy? ( ~dev-python/pyefergy-22.5.0[${PYTHON_USEDEP}] )
	egardia? ( ~dev-python/pythonegardia-1.0.52[${PYTHON_USEDEP}] )
	electrasmart? ( ~dev-python/pyElectra-1.2.4[${PYTHON_USEDEP}] )
	electric_kiwi? ( ~dev-python/electrickiwi-api-0.8.5[${PYTHON_USEDEP}] )
	elgato? ( ~dev-python/elgato-5.1.2[${PYTHON_USEDEP}] )
	eliqonline? ( ~dev-python/eliqonline-1.2.2[${PYTHON_USEDEP}] )
	elkm1? ( ~dev-python/elkm1-lib-2.2.7[${PYTHON_USEDEP}] )
	elmax? ( ~dev-python/elmax-api-0.0.5[${PYTHON_USEDEP}] )
	elv? ( ~dev-python/pypca-0.0.7[${PYTHON_USEDEP}] )
	elvia? ( ~dev-python/elvia-0.1.0[${PYTHON_USEDEP}] )
	emby? ( ~dev-python/pyEmby-1.10[${PYTHON_USEDEP}] )
	emonitor? ( ~dev-python/aioemonitor-1.0.5[${PYTHON_USEDEP}] )
	emulated_kasa? ( ~dev-python/sense-energy-0.12.4[${PYTHON_USEDEP}] )
	emulated_roku? ( ~dev-python/emulated-roku-0.3.0[${PYTHON_USEDEP}] )
	energenie_power_sockets? ( ~dev-python/pyEGPS-0.2.5[${PYTHON_USEDEP}] )
	energyzero? ( ~dev-python/energyzero-2.1.1[${PYTHON_USEDEP}] )
	enigma2? ( ~dev-python/openwebifpy-4.2.7[${PYTHON_USEDEP}] )
	enocean? ( ~dev-python/enocean-0.50.1[${PYTHON_USEDEP}] )
	enphase_envoy? ( ~dev-python/pyenphase-1.22.0[${PYTHON_USEDEP}] )
	entur_public_transport? ( ~dev-python/enturclient-0.2.4[${PYTHON_USEDEP}] )
	environment_canada? ( ~dev-python/env-canada-0.7.2[${PYTHON_USEDEP}] )
	envisalink? ( ~dev-python/pyenvisalink-4.7[${PYTHON_USEDEP}] )
	ephember? ( ~dev-python/pyephember-0.3.1[${PYTHON_USEDEP}] )
	epic_games_store? ( ~dev-python/epicstore-api-0.1.7[${PYTHON_USEDEP}] )
	epion? ( ~dev-python/epion-0.0.3[${PYTHON_USEDEP}] )
	epson? ( ~dev-python/epson-projector-0.5.1[${PYTHON_USEDEP}] )
	eq3btsmart? ( ~dev-python/bleak-esphome-1.0.0[${PYTHON_USEDEP}] ~dev-python/eq3btsmart-1.1.9[${PYTHON_USEDEP}] )
	escea? ( ~dev-python/pescea-1.0.12[${PYTHON_USEDEP}] )
	esphome? ( ~dev-python/aioesphomeapi-27.0.0[${PYTHON_USEDEP}] ~dev-python/bleak-esphome-1.0.0[${PYTHON_USEDEP}] ~dev-python/esphome-dashboard-api-1.2.3[${PYTHON_USEDEP}] )
	etherscan? ( ~dev-python/python-etherscan-api-0.0.3[${PYTHON_USEDEP}] )
	eufy? ( ~dev-python/lakeside-0.13[${PYTHON_USEDEP}] )
	eufylife_ble? ( ~dev-python/eufylife-ble-client-0.1.8[${PYTHON_USEDEP}] )
	everlights? ( ~dev-python/pyeverlights-0.1.0[${PYTHON_USEDEP}] )
	evil_genius_labs? ( ~dev-python/pyevilgenius-2.0.0[${PYTHON_USEDEP}] )
	evohome? ( ~dev-python/evohome-async-0.4.20[${PYTHON_USEDEP}] )
	ezviz? ( ~dev-python/pyezviz-0.2.1.2[${PYTHON_USEDEP}] )
	faa_delays? ( ~dev-python/faadelays-2023.9.1[${PYTHON_USEDEP}] )
	familyhub? ( ~dev-python/python-family-hub-local-0.0.2[${PYTHON_USEDEP}] )
	fastdotcom? ( ~dev-python/fastdotcom-0.0.3[${PYTHON_USEDEP}] )
	feedreader? ( ~dev-python/feedparser-6.0.11[${PYTHON_USEDEP}] )
	ffmpeg? ( ~dev-python/ha-ffmpeg-3.2.0[${PYTHON_USEDEP}] )
	fibaro? ( ~dev-python/pyfibaro-0.7.8[${PYTHON_USEDEP}] )
	fido? ( ~dev-python/pyfido-2.1.2[${PYTHON_USEDEP}] )
	file? ( ~dev-python/file-read-backwards-2.0.0[${PYTHON_USEDEP}] )
	fints? ( ~dev-python/fints-3.1.0[${PYTHON_USEDEP}] )
	fireservicerota? ( ~dev-python/pyfireservicerota-0.0.43[${PYTHON_USEDEP}] )
	firmata? ( ~dev-python/pymata-express-1.19[${PYTHON_USEDEP}] )
	fitbit? ( ~dev-python/fitbit-0.3.1[${PYTHON_USEDEP}] )
	fivem? ( ~dev-python/fivem-api-0.1.2[${PYTHON_USEDEP}] )
	fixer? ( ~dev-python/fixerio-1.0.0_alpha0[${PYTHON_USEDEP}] )
	fjaraskupan? ( ~dev-python/fjaraskupan-2.3.0[${PYTHON_USEDEP}] )
	fleetgo? ( ~dev-python/ritassist-0.9.2[${PYTHON_USEDEP}] )
	flexit_bacnet? ( ~dev-python/flexit-bacnet-2.2.1[${PYTHON_USEDEP}] )
	flic? ( ~dev-python/pyflic-2.0.4[${PYTHON_USEDEP}] )
	flick_electric? ( ~dev-python/PyFlick-0.0.2[${PYTHON_USEDEP}] )
	flipr? ( ~dev-python/flipr-api-1.6.1[${PYTHON_USEDEP}] )
	flo? ( ~dev-python/aioflo-2021.11.0[${PYTHON_USEDEP}] )
	flume? ( ~dev-python/PyFlume-0.6.5[${PYTHON_USEDEP}] )
	flux_led? ( ~dev-python/flux-led-1.0.4[${PYTHON_USEDEP}] )
	folder_watcher? ( ~dev-python/watchdog-2.3.1[${PYTHON_USEDEP}] )
	foobot? ( ~dev-python/foobot_async-1.0.0[${PYTHON_USEDEP}] )
	forecast_solar? ( ~dev-python/forecast-solar-3.1.0[${PYTHON_USEDEP}] )
	forked_daapd? ( ~dev-python/pyforked-daapd-0.1.14[${PYTHON_USEDEP}] ~dev-python/pylibrespot-java-0.1.1[${PYTHON_USEDEP}] )
	fortios? ( ~dev-python/fortiosapi-1.0.5[${PYTHON_USEDEP}] )
	foscam? ( ~dev-python/libpyfoscam-1.2.2[${PYTHON_USEDEP}] )
	freebox? ( ~dev-python/freebox-api-1.1.0[${PYTHON_USEDEP}] )
	freedompro? ( ~dev-python/pyfreedompro-1.1.0[${PYTHON_USEDEP}] )
	free_mobile? ( ~dev-python/freesms-0.2.0[${PYTHON_USEDEP}] )
	fritz? ( ~dev-python/fritzconnection-1.13.2[qrcode,${PYTHON_USEDEP}] ~dev-python/xmltodict-0.13.0[${PYTHON_USEDEP}] )
	fritzbox? ( ~dev-python/pyfritzhome-0.6.12[${PYTHON_USEDEP}] )
	fritzbox_callmonitor? ( ~dev-python/fritzconnection-1.13.2[qrcode,${PYTHON_USEDEP}] )
	fronius? ( ~dev-python/PyFronius-0.7.3[${PYTHON_USEDEP}] )
	frontier_silicon? ( ~dev-python/afsapi-0.2.7[${PYTHON_USEDEP}] )
	fully_kiosk? ( ~dev-python/python-fullykiosk-0.0.14[${PYTHON_USEDEP}] )
	futurenow? ( ~dev-python/pyfnip-0.2[${PYTHON_USEDEP}] )
	fyta? ( ~dev-python/fyta-cli-0.6.7[${PYTHON_USEDEP}] )
	garages_amsterdam? ( ~dev-python/odp-amsterdam-6.0.2[${PYTHON_USEDEP}] )
	gardena_bluetooth? ( ~dev-python/gardena-bluetooth-1.4.3[${PYTHON_USEDEP}] )
	gc100? ( ~dev-python/python-gc100-1.0.3_alpha0[${PYTHON_USEDEP}] )
	gdacs? ( ~dev-python/aio-georss-gdacs-0.10[${PYTHON_USEDEP}] )
	generic? ( ~dev-python/pillow-10.4.0[${PYTHON_USEDEP}] ~dev-python/ha-av-10.1.1[${PYTHON_USEDEP}] )
	geniushub? ( ~dev-python/geniushub-client-0.7.1[${PYTHON_USEDEP}] )
	geocaching? ( ~dev-python/geocachingapi-0.2.1[${PYTHON_USEDEP}] )
	geonetnz_quakes? ( ~dev-python/aio-geojson-geonetnz-quakes-0.16[${PYTHON_USEDEP}] )
	geonetnz_volcano? ( ~dev-python/aio-geojson-geonetnz-volcano-0.9[${PYTHON_USEDEP}] )
	geo_json_events? ( ~dev-python/aio-geojson-generic-client-0.4[${PYTHON_USEDEP}] )
	geo_rss_events? ( ~dev-python/georss-generic-client-0.8[${PYTHON_USEDEP}] )
	gios? ( ~dev-python/gios-4.0.0[${PYTHON_USEDEP}] )
	github? ( ~dev-python/aiogithubapi-24.6.0[${PYTHON_USEDEP}] )
	gitlab_ci? ( ~dev-vcs/python-gitlab-1.6.0[${PYTHON_USEDEP}] )
	gitter? ( ~dev-python/gitterpy-0.1.7[${PYTHON_USEDEP}] )
	glances? ( ~dev-python/glances-api-0.8.0[${PYTHON_USEDEP}] )
	goalzero? ( ~dev-python/goalzero-0.2.2[${PYTHON_USEDEP}] )
	gogogate2? ( ~dev-python/ismartgate-5.0.1[${PYTHON_USEDEP}] )
	goodwe? ( ~dev-python/goodwe-0.3.6[${PYTHON_USEDEP}] )
	google? ( ~dev-python/gcal-sync-6.1.6[${PYTHON_USEDEP}] ~dev-python/ical-8.2.0[${PYTHON_USEDEP}] ~dev-python/oauth2client-4.1.3[${PYTHON_USEDEP}] )
	google_assistant_sdk? ( ~dev-python/gassist-text-0.0.11[${PYTHON_USEDEP}] )
	google_cloud? ( ~dev-python/google-cloud-speech-2.27.0[${PYTHON_USEDEP}] ~dev-python/google-cloud-texttospeech-2.17.2[${PYTHON_USEDEP}] )
	google_generative_ai_conversation? ( ~dev-python/google-generativeai-0.8.2[${PYTHON_USEDEP}] )
	google_mail? ( ~dev-python/google-api-python-client-2.71.0[${PYTHON_USEDEP}] )
	google_maps? ( ~dev-python/locationsharinglib-5.0.1[${PYTHON_USEDEP}] )
	google_pubsub? ( ~dev-python/google-cloud-pubsub-2.23.0[${PYTHON_USEDEP}] )
	google_sheets? ( ~dev-python/gspread-5.5.0[${PYTHON_USEDEP}] )
	google_tasks? ( ~dev-python/google-api-python-client-2.71.0[${PYTHON_USEDEP}] )
	google_translate? ( ~dev-python/gTTS-2.2.4[${PYTHON_USEDEP}] )
	google_travel_time? ( ~dev-python/googlemaps-2.5.1[${PYTHON_USEDEP}] )
	govee_ble? ( ~dev-python/govee-ble-0.40.0[${PYTHON_USEDEP}] )
	govee_light_local? ( ~dev-python/govee-local-api-1.5.2[${PYTHON_USEDEP}] )
	gpsd? ( ~dev-python/gps3-0.33.3[${PYTHON_USEDEP}] )
	gree? ( ~dev-python/greeclimate-2.1.0[${PYTHON_USEDEP}] )
	greeneye_monitor? ( ~dev-python/greeneye-monitor-3.0.3[${PYTHON_USEDEP}] )
	greenwave? ( ~dev-python/greenwavereality-0.5.1[${PYTHON_USEDEP}] )
	growatt_server? ( ~dev-python/growattServer-1.5.0[${PYTHON_USEDEP}] )
	gstreamer? ( ~dev-python/gstreamer-player-1.1.2[${PYTHON_USEDEP}] )
	gtfs? ( ~dev-python/pygtfs-0.1.9[${PYTHON_USEDEP}] )
	guardian? ( ~dev-python/aioguardian-2022.7.0[${PYTHON_USEDEP}] )
	habitica? ( ~dev-python/habitipy-0.3.1[${PYTHON_USEDEP}] )
	hardware? ( ~dev-python/psutil-home-assistant-0.0.1[${PYTHON_USEDEP}] )
	harman_kardon_avr? ( ~dev-python/hkavr-0.0.5[${PYTHON_USEDEP}] )
	harmony? ( ~dev-python/aioharmony-0.2.10[${PYTHON_USEDEP}] )
	hdmi_cec? ( ~dev-python/pyCEC-0.5.2[${PYTHON_USEDEP}] )
	heatmiser? ( ~dev-python/heatmiserV3-1.1.18[${PYTHON_USEDEP}] )
	heos? ( ~dev-python/pyheos-0.7.2[${PYTHON_USEDEP}] )
	here_travel_time? ( ~dev-python/here-routing-1.0.1[${PYTHON_USEDEP}] ~dev-python/here-transit-1.2.1[${PYTHON_USEDEP}] )
	hikvision? ( ~dev-python/pyHik-0.3.2[${PYTHON_USEDEP}] )
	hikvisioncam? ( ~dev-python/hikvision-0.4[${PYTHON_USEDEP}] )
	hisense_aehw4a1? ( ~dev-python/pyaehw4a1-0.3.9[${PYTHON_USEDEP}] )
	hive? ( ~dev-python/pyhiveapi-0.5.16[${PYTHON_USEDEP}] )
	hko? ( ~dev-python/hko-0.3.2[${PYTHON_USEDEP}] )
	hlk_sw16? ( ~dev-python/hlk-sw16-0.0.9[${PYTHON_USEDEP}] )
	holiday? ( ~dev-python/Babel-2.15.0[${PYTHON_USEDEP}] ~dev-python/holidays-0.58[${PYTHON_USEDEP}] )
	homekit? ( ~dev-python/HAP-python-4.9.1[${PYTHON_USEDEP}] ~dev-python/pyqrcode-1.2.1[${PYTHON_USEDEP}] ~dev-python/base36-0.1.1[${PYTHON_USEDEP}] ~dev-python/fnv-hash-fast-1.0.2[${PYTHON_USEDEP}] )
	homekit_controller? ( ~dev-python/aiohomekit-3.2.3[${PYTHON_USEDEP}] )
	homematic? ( ~dev-python/pyhomematic-0.1.77[${PYTHON_USEDEP}] )
	homematicip_cloud? ( ~dev-python/homematicip-1.1.2[${PYTHON_USEDEP}] )
	homewizard? ( ~dev-python/python-homewizard-energy-6.3.0[${PYTHON_USEDEP}] )
	homeworks? ( ~dev-python/pyhomeworks-1.1.2[${PYTHON_USEDEP}] )
	home_connect? ( ~dev-python/homeconnect-0.8.0[${PYTHON_USEDEP}] )
	honeywell? ( ~dev-python/AIOSomecomfort-0.0.25[${PYTHON_USEDEP}] )
	horizon? ( ~dev-python/horimote-0.4.1[${PYTHON_USEDEP}] )
	hp_ilo? ( ~dev-python/python-hpilo-4.4.3[${PYTHON_USEDEP}] )
	html5? ( ~dev-python/pywebpush-1.14.1[${PYTHON_USEDEP}] )
	huawei_lte? ( ~dev-python/huawei-lte-api-1.7.3[${PYTHON_USEDEP}] ~dev-python/stringcase-1.2.0[${PYTHON_USEDEP}] ~dev-python/url-normalize-1.4.3[${PYTHON_USEDEP}] )
	hue? ( ~dev-python/aiohue-4.7.3[${PYTHON_USEDEP}] )
	huisbaasje? ( ~dev-python/energyflip-client-0.2.2[${PYTHON_USEDEP}] )
	hunterdouglas_powerview? ( ~dev-python/aiopvapi-3.1.1[${PYTHON_USEDEP}] )
	husqvarna_automower? ( ~dev-python/aioautomower-2024.10.0[${PYTHON_USEDEP}] )
	huum? ( ~dev-python/huum-0.7.10[${PYTHON_USEDEP}] )
	hvv_departures? ( ~dev-python/pygti-0.9.4[${PYTHON_USEDEP}] )
	hydrawise? ( ~dev-python/pydrawise-2024.9.0[${PYTHON_USEDEP}] )
	hyperion? ( ~dev-python/hyperion-py-0.7.5[${PYTHON_USEDEP}] )
	ialarm? ( ~dev-python/pyialarm-2.2.0[${PYTHON_USEDEP}] )
	iammeter? ( ~dev-python/iammeter-0.2.1[${PYTHON_USEDEP}] )
	iaqualink? ( ~dev-python/h2-4.1.0[${PYTHON_USEDEP}] ~dev-python/iaqualink-0.5.0[${PYTHON_USEDEP}] )
	ibeacon? ( ~dev-python/ibeacon-ble-1.2.0[${PYTHON_USEDEP}] )
	icloud? ( ~dev-python/pyicloud-1.0.0[${PYTHON_USEDEP}] )
	idasen_desk? ( ~dev-python/idasen-ha-2.6.2[${PYTHON_USEDEP}] )
	idteck_prox? ( ~dev-python/rfk101py-0.0.1[${PYTHON_USEDEP}] )
	ifttt? ( ~dev-python/pyfttt-0.3.2[${PYTHON_USEDEP}] )
	iglo? ( ~dev-python/iglo-1.2.7[${PYTHON_USEDEP}] )
	ign_sismologia? ( ~dev-python/georss-ign-sismologia-client-0.8[${PYTHON_USEDEP}] )
	ihc? ( ~dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}] ~dev-python/ihcsdk-2.8.5[${PYTHON_USEDEP}] )
	image_upload? ( ~dev-python/pillow-10.4.0[${PYTHON_USEDEP}] )
	imap? ( ~dev-python/aioimaplib-1.1.0[${PYTHON_USEDEP}] )
	imgw_pib? ( ~dev-python/imgw-pib-1.0.6[${PYTHON_USEDEP}] )
	improv_ble? ( ~dev-python/py-improv-ble-client-1.0.3[${PYTHON_USEDEP}] )
	incomfort? ( ~dev-python/incomfort-client-0.6.3-r1[${PYTHON_USEDEP}] )
	influxdb? ( ~dev-python/influxdb-client-1.24.0[${PYTHON_USEDEP}] ~dev-python/influxdb-5.3.1[${PYTHON_USEDEP}] )
	inkbird? ( ~dev-python/inkbird-ble-0.5.8[${PYTHON_USEDEP}] )
	insteon? ( ~dev-python/insteon-frontend-home-assistant-0.5.0[${PYTHON_USEDEP}] ~dev-python/pyinsteon-1.6.3[${PYTHON_USEDEP}] )
	intellifire? ( ~dev-python/intellifire4py-4.1.9[${PYTHON_USEDEP}] )
	intesishome? ( ~dev-python/pyintesishome-1.8.0[${PYTHON_USEDEP}] )
	iotawatt? ( ~dev-python/ha-iotawattpy-0.1.2[${PYTHON_USEDEP}] )
	iperf3? ( ~dev-python/iperf3-0.1.11[${PYTHON_USEDEP}] )
	ipma? ( ~dev-python/pyipma-3.0.7[${PYTHON_USEDEP}] )
	ipp? ( ~dev-python/pyipp-0.17.0[${PYTHON_USEDEP}] )
	iqvia? ( ~dev-python/numpy-1.26.4[${PYTHON_USEDEP}] ~dev-python/pyiqvia-2022.4.0[${PYTHON_USEDEP}] )
	irish_rail_transport? ( ~dev-python/pyirishrail-0.0.2[${PYTHON_USEDEP}] )
	isal? ( ~dev-python/isal-1.7.1[${PYTHON_USEDEP}] )
	islamic_prayer_times? ( ~dev-python/prayer-times-calculator-offline-1.0.3[${PYTHON_USEDEP}] )
	iss? ( ~dev-python/pyiss-1.0.1[${PYTHON_USEDEP}] )
	isy994? ( ~dev-python/pyisy-3.1.14[${PYTHON_USEDEP}] )
	itach? ( ~dev-python/pyitachip2ir-0.0.7[${PYTHON_USEDEP}] )
	izone? ( ~dev-python/python-izone-1.2.9[${PYTHON_USEDEP}] )
	jellyfin? ( ~dev-python/jellyfin-apiclient-python-1.9.2[${PYTHON_USEDEP}] )
	jewish_calendar? ( ~dev-python/hdate-0.10.9[${PYTHON_USEDEP}] )
	joaoapps_join? ( ~dev-python/python-join-api-0.0.9[${PYTHON_USEDEP}] )
	juicenet? ( ~dev-python/python-juicenet-1.1.0[${PYTHON_USEDEP}] )
	justnimbus? ( ~dev-python/justnimbus-0.7.4[${PYTHON_USEDEP}] )
	jvc_projector? ( ~dev-python/pyjvcprojector-1.1.2[${PYTHON_USEDEP}] )
	kaiterra? ( ~dev-python/kaiterra-async-client-1.0.0[${PYTHON_USEDEP}] )
	kaleidescape? ( ~dev-python/pykaleidescape-1.0.1[${PYTHON_USEDEP}] )
	keba? ( ~dev-python/keba-kecontact-1.1.0[${PYTHON_USEDEP}] )
	keenetic_ndms2? ( ~dev-python/ndms2-client-0.1.2[${PYTHON_USEDEP}] )
	kef? ( ~dev-python/aiokef-0.2.16[${PYTHON_USEDEP}] ~dev-python/getmac-0.9.4[${PYTHON_USEDEP}] )
	kegtron? ( ~dev-python/kegtron-ble-0.4.0[${PYTHON_USEDEP}] )
	keyboard? ( ~dev-python/pyvera-0.3.13[${PYTHON_USEDEP}] )
	keyboard_remote? ( ~dev-python/asyncinotify-4.0.2[${PYTHON_USEDEP}] ~dev-python/evohome-async-0.4.20[${PYTHON_USEDEP}] )
	keymitt_ble? ( ~dev-python/PyMicroBot-0.0.17[${PYTHON_USEDEP}] )
	kira? ( ~dev-python/pykira-0.1.1[${PYTHON_USEDEP}] )
	kiwi? ( ~dev-python/kiwiki-client-0.1.1[${PYTHON_USEDEP}] )
	kmtronic? ( ~dev-python/pykmtronic-0.3.0[${PYTHON_USEDEP}] )
	knx? ( ~dev-python/knx-frontend-2024.9.10.221729[${PYTHON_USEDEP}] ~dev-python/xknx-3.2.0[${PYTHON_USEDEP}] ~dev-python/xknxproject-3.8.1[${PYTHON_USEDEP}] )
	kodi? ( ~dev-python/pykodi-0.2.7[${PYTHON_USEDEP}] )
	konnected? ( ~dev-python/konnected-1.2.0[${PYTHON_USEDEP}] )
	kostal_plenticore? ( ~dev-python/pykoplenti-1.2.2[${PYTHON_USEDEP}] )
	kraken? ( ~dev-python/krakenex-2.1.0[${PYTHON_USEDEP}] ~dev-python/pykrakenapi-0.1.8[${PYTHON_USEDEP}] )
	kulersky? ( ~dev-python/pykulersky-0.5.2[${PYTHON_USEDEP}] )
	kwb? ( ~dev-python/pykwb-0.0.8[${PYTHON_USEDEP}] )
	lacrosse? ( ~dev-python/pylacrosse-0.4[${PYTHON_USEDEP}] )
	lacrosse_view? ( ~dev-python/lacrosse-view-1.0.2[${PYTHON_USEDEP}] )
	lamarzocco? ( ~dev-python/lmcloud-1.2.3[${PYTHON_USEDEP}] )
	lametric? ( ~dev-python/demetriek-0.4.0[${PYTHON_USEDEP}] )
	landisgyr_heat_meter? ( ~dev-python/ultraheat-api-0.5.7[${PYTHON_USEDEP}] )
	lastfm? ( ~dev-python/pylast-5.1.0[${PYTHON_USEDEP}] )
	launch_library? ( ~dev-python/pylaunches-2.0.0[${PYTHON_USEDEP}] )
	laundrify? ( ~dev-python/laundrify-aio-1.2.2[${PYTHON_USEDEP}] )
	lcn? ( ~dev-python/lcn-frontend-0.1.6[${PYTHON_USEDEP}] ~dev-python/pypck-0.7.23[${PYTHON_USEDEP}] )
	ld2410_ble? ( ~dev-python/bluetooth-data-tools-1.20.0[${PYTHON_USEDEP}] ~dev-python/ld2410-ble-0.1.1[${PYTHON_USEDEP}] )
	leaone? ( ~dev-python/leaone-ble-0.1.0[${PYTHON_USEDEP}] )
	led_ble? ( ~dev-python/bluetooth-data-tools-1.20.0[${PYTHON_USEDEP}] ~dev-python/led-ble-1.0.2[${PYTHON_USEDEP}] )
	lg_netcast? ( ~dev-python/pylgnetcast-0.3.9[${PYTHON_USEDEP}] )
	lg_soundbar? ( ~dev-python/temescal-0.5[${PYTHON_USEDEP}] )
	lidarr? ( ~dev-python/aiopyarr-23.4.0[${PYTHON_USEDEP}] )
	lifx? ( ~dev-python/aiolifx-effects-0.3.2[${PYTHON_USEDEP}] ~dev-python/aiolifx-themes-0.5.5[${PYTHON_USEDEP}] ~dev-python/aiolifx-1.1.1[${PYTHON_USEDEP}] )
	lightwave? ( ~dev-python/lightwave-0.24[${PYTHON_USEDEP}] )
	limitlessled? ( ~dev-python/limitlessled-1.1.3[${PYTHON_USEDEP}] )
	linear_garage_door? ( ~dev-python/linear-garage-door-0.2.9[${PYTHON_USEDEP}] )
	linode? ( ~dev-python/linode-api-4.1.9_beta1[${PYTHON_USEDEP}] )
	linux_battery? ( ~dev-python/batinfo-0.4.2[${PYTHON_USEDEP}] )
	litejet? ( ~dev-python/pylitejet-0.6.3[${PYTHON_USEDEP}] )
	litterrobot? ( ~dev-python/pylitterbot-2023.5.0[${PYTHON_USEDEP}] )
	livisi? ( ~dev-python/aiolivisi-0.0.19[${PYTHON_USEDEP}] )
	local_calendar? ( ~dev-python/ical-8.2.0[${PYTHON_USEDEP}] )
	local_todo? ( ~dev-python/ical-8.2.0[${PYTHON_USEDEP}] )
	london_underground? ( ~dev-python/london-tube-status-0.5[${PYTHON_USEDEP}] )
	lookin? ( ~dev-python/aiolookin-1.0.0[${PYTHON_USEDEP}] )
	loqed? ( ~dev-python/loqedAPI-2.1.10[${PYTHON_USEDEP}] )
	luci? ( ~dev-python/openwrt-luci-rpc-1.1.17[${PYTHON_USEDEP}] )
	luftdaten? ( ~dev-python/luftdaten-0.7.4[${PYTHON_USEDEP}] )
	lupusec? ( ~dev-python/lupupy-0.3.2[${PYTHON_USEDEP}] )
	lutron? ( ~dev-python/pylutron-0.2.15[${PYTHON_USEDEP}] )
	lutron_caseta? ( ~dev-python/pylutron-caseta-0.21.1[${PYTHON_USEDEP}] )
	lw12wifi? ( ~dev-python/lw12-0.9.2[${PYTHON_USEDEP}] )
	lyric? ( ~dev-python/aiolyric-2.0.1[${PYTHON_USEDEP}] )
	mailgun? ( ~dev-python/pymailgunner-1.4[${PYTHON_USEDEP}] )
	marytts? ( ~dev-python/speak2mary-1.4.0[${PYTHON_USEDEP}] )
	mastodon? ( ~dev-python/Mastodon-py-1.8.1[${PYTHON_USEDEP}] )
	matrix? ( ~dev-python/pillow-10.4.0[${PYTHON_USEDEP}] ~dev-python/matrix-nio-0.25.2[${PYTHON_USEDEP}] )
	matter? ( ~dev-python/python-matter-server-6.5.2[${PYTHON_USEDEP}] )
	maxcube? ( ~dev-python/maxcube-api-0.4.3[${PYTHON_USEDEP}] )
	meater? ( ~dev-python/meater-python-0.0.8[${PYTHON_USEDEP}] )
	medcom_ble? ( ~dev-python/medcom-ble-0.1.1[${PYTHON_USEDEP}] )
	mediaroom? ( ~dev-python/pymediaroom-0.6.5.4[${PYTHON_USEDEP}] )
	media_extractor? ( ~net-misc/yt-dlp-2024.10.22[${PYTHON_USEDEP}] )
	melcloud? ( ~dev-python/pymelcloud-2.5.9[${PYTHON_USEDEP}] )
	melissa? ( ~dev-python/py-melissa-climate-2.1.4[${PYTHON_USEDEP}] )
	melnor? ( ~dev-python/melnor-bluetooth-0.0.25[${PYTHON_USEDEP}] )
	message_bird? ( ~dev-python/messagebird-1.2.0[${PYTHON_USEDEP}] )
	met? ( ~dev-python/PyMetno-0.13.0[${PYTHON_USEDEP}] )
	meteoalarm? ( ~dev-python/meteoalertapi-0.3.1[${PYTHON_USEDEP}] )
	meteoclimatic? ( ~dev-python/pymeteoclimatic-0.1.0[${PYTHON_USEDEP}] )
	meteo_france? ( ~dev-python/meteofrance-api-1.3.0[${PYTHON_USEDEP}] )
	metoffice? ( ~dev-python/datapoint-0.9.9[${PYTHON_USEDEP}] )
	met_eireann? ( ~dev-python/PyMetEireann-2021.8.0[${PYTHON_USEDEP}] )
	mfi? ( ~dev-python/mficlient-0.5.0[${PYTHON_USEDEP}] )
	microbees? ( ~dev-python/microBeesPy-0.3.2[${PYTHON_USEDEP}] )
	microsoft? ( ~dev-python/pycsspeechtts-1.0.8[${PYTHON_USEDEP}] )
	mikrotik? ( ~dev-python/librouteros-3.2.0[${PYTHON_USEDEP}] )
	mill? ( ~dev-python/mill-local-0.3.0[${PYTHON_USEDEP}] ~dev-python/millheater-0.11.8[${PYTHON_USEDEP}] )
	minecraft_server? ( ~dev-python/mcstatus-11.1.1[${PYTHON_USEDEP}] )
	minio? ( ~dev-python/minio-7.1.12[${PYTHON_USEDEP}] )
	moat? ( ~dev-python/moat-ble-0.1.1[${PYTHON_USEDEP}] )
	mobile_app? ( ~dev-python/pynacl-1.5.0[${PYTHON_USEDEP}] )
	mochad? ( ~dev-python/pymochad-0.2.0[${PYTHON_USEDEP}] )
	modbus? ( ~dev-python/pymodbus-3.6.9[${PYTHON_USEDEP}] )
	modem_callerid? ( ~dev-python/phone-modem-0.1.1[${PYTHON_USEDEP}] )
	modern_forms? ( ~dev-python/aiomodernforms-0.1.8[${PYTHON_USEDEP}] )
	moehlenhoff_alpha2? ( ~dev-python/moehlenhoff-alpha2-1.3.1[${PYTHON_USEDEP}] )
	monoprice? ( ~dev-python/pymonoprice-0.4[${PYTHON_USEDEP}] )
	monzo? ( ~dev-python/monzopy-1.3.2[${PYTHON_USEDEP}] )
	mopeka? ( ~dev-python/mopeka-iot-ble-0.8.0[${PYTHON_USEDEP}] )
	motionblinds_ble? ( ~dev-python/motionblindsble-0.1.2[${PYTHON_USEDEP}] )
	motioneye? ( ~dev-python/motioneye-client-0.3.14[${PYTHON_USEDEP}] )
	motionmount? ( ~dev-python/python-MotionMount-2.2.0[${PYTHON_USEDEP}] )
	motion_blinds? ( ~dev-python/motionblinds-0.6.25[${PYTHON_USEDEP}] )
	mpd? ( ~dev-python/python-mpd2-3.1.1[${PYTHON_USEDEP}] )
	mqtt? ( ~dev-python/paho-mqtt-1.6.1[${PYTHON_USEDEP}] )
	msteams? ( ~dev-python/pymsteams-0.1.12[${PYTHON_USEDEP}] )
	mullvad? ( ~dev-python/mullvad-api-1.0.0[${PYTHON_USEDEP}] )
	mutesync? ( ~dev-python/mutesync-0.0.1[${PYTHON_USEDEP}] )
	mysensors? ( ~dev-python/pymysensors-0.24.0[${PYTHON_USEDEP}] )
	mystrom? ( ~dev-python/python-mystrom-2.2.0[${PYTHON_USEDEP}] )
	mythicbeastsdns? ( ~dev-python/mbddns-0.1.2[${PYTHON_USEDEP}] )
	myuplink? ( ~dev-python/myuplink-0.6.0[${PYTHON_USEDEP}] )
	nad? ( ~dev-python/nad-receiver-0.3.0[${PYTHON_USEDEP}] )
	nam? ( ~dev-python/nettigo-air-monitor-3.3.0[${PYTHON_USEDEP}] )
	namecheapdns? ( ~dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}] )
	nanoleaf? ( ~dev-python/aionanoleaf-0.2.1[${PYTHON_USEDEP}] )
	neato? ( ~dev-python/pybotvac-0.0.25[${PYTHON_USEDEP}] )
	nederlandse_spoorwegen? ( ~dev-python/nsapi-3.0.5[${PYTHON_USEDEP}] )
	ness_alarm? ( ~dev-python/nessclient-1.1.2[${PYTHON_USEDEP}] )
	nest? ( ~dev-python/google-nest-sdm-5.0.1[${PYTHON_USEDEP}] )
	netatmo? ( ~dev-python/pyatmo-8.1.0[${PYTHON_USEDEP}] )
	netdata? ( ~dev-python/netdata-1.1.0[${PYTHON_USEDEP}] )
	netgear? ( ~dev-python/pynetgear-0.10.10[${PYTHON_USEDEP}] )
	netgear_lte? ( ~dev-python/eternalegypt-0.0.16[${PYTHON_USEDEP}] )
	netio? ( ~dev-python/pynetio-0.1.9.1[${PYTHON_USEDEP}] )
	network? ( ~dev-python/ifaddr-0.2.0[${PYTHON_USEDEP}] )
	neurio_energy? ( ~dev-python/neurio-0.3.1[${PYTHON_USEDEP}] )
	nexia? ( ~dev-python/nexia-2.0.8[${PYTHON_USEDEP}] )
	nextbus? ( ~dev-python/py-nextbusnext-2.0.5[${PYTHON_USEDEP}] )
	nextcloud? ( ~dev-python/nextcloudmonitor-1.5.1[${PYTHON_USEDEP}] )
	nextdns? ( ~dev-python/nextdns-3.3.0[${PYTHON_USEDEP}] )
	nfandroidtv? ( ~dev-python/notifications-android-tv-0.1.5[${PYTHON_USEDEP}] )
	nibe_heatpump? ( ~dev-python/nibe-2.11.0[${PYTHON_USEDEP}] )
	nightscout? ( ~dev-python/py-nightscout-1.2.2[${PYTHON_USEDEP}] )
	niko_home_control? ( ~dev-python/niko-home-control-0.2.1[${PYTHON_USEDEP}] )
	nilu? ( ~dev-python/niluclient-0.1.2[${PYTHON_USEDEP}] )
	nina? ( ~dev-python/PyNINA-0.3.3[${PYTHON_USEDEP}] )
	nissan_leaf? ( ~dev-python/pycarwings2-2.14[${PYTHON_USEDEP}] )
	nmap_tracker? ( ~dev-python/aiooui-0.1.6[${PYTHON_USEDEP}] ~dev-python/getmac-0.9.4[${PYTHON_USEDEP}] ~dev-python/netmap-0.7.0.2[${PYTHON_USEDEP}] )
	nmbs? ( ~dev-python/pyrail-0.0.3[${PYTHON_USEDEP}] )
	noaa_tides? ( ~dev-python/noaa-coops-0.1.9[${PYTHON_USEDEP}] )
	nobo_hub? ( ~dev-python/pynobo-1.8.1[${PYTHON_USEDEP}] )
	norway_air? ( ~dev-python/PyMetno-0.13.0[${PYTHON_USEDEP}] )
	notify_events? ( ~dev-python/notify-events-1.0.4[${PYTHON_USEDEP}] )
	notion? ( ~dev-python/aionotion-2024.3.0[${PYTHON_USEDEP}] )
	nsw_fuel_station? ( ~dev-python/nsw-fuel-api-client-1.1.0[${PYTHON_USEDEP}] )
	nsw_rural_fire_service_feed? ( ~dev-python/aio-geojson-nsw-rfs-incidents-0.7[${PYTHON_USEDEP}] )
	nuheat? ( ~dev-python/nuheat-1.0.1[${PYTHON_USEDEP}] )
	nuki? ( ~dev-python/pynuki-1.6.3[${PYTHON_USEDEP}] )
	numato? ( ~dev-python/numato-gpio-0.13.0[${PYTHON_USEDEP}] )
	nut? ( ~dev-python/aionut-4.3.3[${PYTHON_USEDEP}] )
	nws? ( ~dev-python/pynws-1.8.2[retry,${PYTHON_USEDEP}] )
	nx584? ( ~dev-python/pynx584-0.8.2[${PYTHON_USEDEP}] )
	nzbget? ( ~dev-python/pynzbgetapi-0.2.0[${PYTHON_USEDEP}] )
	oasa_telematics? ( ~dev-python/oasatelematics-0.3[${PYTHON_USEDEP}] )
	obihai? ( ~dev-python/pyobihai-1.4.2[${PYTHON_USEDEP}] )
	octoprint? ( ~dev-python/pyoctoprintapi-0.1.12[${PYTHON_USEDEP}] )
	oem? ( ~dev-python/oemthermostat-1.1.1[${PYTHON_USEDEP}] )
	ohmconnect? ( ~dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}] )
	ollama? ( ~dev-python/ollama-0.3.1[${PYTHON_USEDEP}] )
	ombi? ( ~dev-python/pyombi-0.1.10[${PYTHON_USEDEP}] )
	omnilogic? ( ~dev-python/omnilogic-0.4.5[${PYTHON_USEDEP}] )
	oncue? ( ~dev-python/aiooncue-0.3.7[${PYTHON_USEDEP}] )
	ondilo_ico? ( ~dev-python/ondilo-0.5.0[${PYTHON_USEDEP}] )
	onkyo? ( ~dev-python/pyeiscp-0.0.7[${PYTHON_USEDEP}] )
	onvif? ( ~dev-python/WSDiscovery-2.0.0[${PYTHON_USEDEP}] ~dev-python/onvif-zeep-async-3.1.12[${PYTHON_USEDEP}] )
	openai_conversation? ( ~dev-python/openai-1.35.7[${PYTHON_USEDEP}] )
	openerz? ( ~dev-python/openerz-api-0.3.0[${PYTHON_USEDEP}] )
	openevse? ( ~dev-python/openevsewifi-1.1.2[${PYTHON_USEDEP}] )
	opengarage? ( ~dev-python/open-garage-0.2.0[${PYTHON_USEDEP}] )
	openhome? ( ~dev-python/openhomedevice-2.2[${PYTHON_USEDEP}] )
	opensensemap? ( ~dev-python/opensensemap-api-0.2.0[${PYTHON_USEDEP}] )
	opensky? ( ~dev-python/python-opensky-1.0.1[${PYTHON_USEDEP}] )
	opentherm_gw? ( ~dev-python/pyotgw-2.2.2[${PYTHON_USEDEP}] )
	openuv? ( ~dev-python/pyopenuv-2023.2.0[${PYTHON_USEDEP}] )
	openweathermap? ( ~dev-python/pyopenweathermap-0.1.1[${PYTHON_USEDEP}] )
	open_meteo? ( ~dev-python/open-meteo-0.3.1[${PYTHON_USEDEP}] )
	opnsense? ( ~dev-python/pyopnsense-0.4.0[${PYTHON_USEDEP}] )
	opower? ( ~dev-python/opower-0.8.3[${PYTHON_USEDEP}] )
	opple? ( ~dev-python/pyoppleio-legacy-1.0.8[${PYTHON_USEDEP}] )
	oralb? ( ~dev-python/oralb-ble-0.17.6[${PYTHON_USEDEP}] )
	oru? ( ~dev-python/oru-0.1.11[${PYTHON_USEDEP}] )
	orvibo? ( ~dev-python/orvibo-1.1.2[${PYTHON_USEDEP}] )
	osoenergy? ( ~dev-python/pyosoenergyapi-1.1.4[${PYTHON_USEDEP}] )
	osramlightify? ( ~dev-python/lightify-1.0.7.3[${PYTHON_USEDEP}] )
	otbr? ( ~dev-python/python-otbr-api-2.6.0[${PYTHON_USEDEP}] )
	otp? ( ~dev-python/pyotp-2.8.0[${PYTHON_USEDEP}] )
	ourgroceries? ( ~dev-python/ourgroceries-1.5.4[${PYTHON_USEDEP}] )
	overkiz? ( ~dev-python/pyoverkiz-1.14.1[${PYTHON_USEDEP}] )
	ovo_energy? ( ~dev-python/ovoenergy-2.0.0[${PYTHON_USEDEP}] )
	owntracks? ( ~dev-python/pynacl-1.5.0[${PYTHON_USEDEP}] )
	p1_monitor? ( ~dev-python/p1monitor-3.0.1[${PYTHON_USEDEP}] )
	panasonic_bluray? ( ~dev-python/panacotta-0.2[${PYTHON_USEDEP}] )
	panasonic_viera? ( ~dev-python/panasonic-viera-0.4.2[${PYTHON_USEDEP}] )
	pandora? ( ~dev-python/pexpect-4.6.0[${PYTHON_USEDEP}] )
	peco? ( ~dev-python/peco-0.0.30[${PYTHON_USEDEP}] )
	pegel_online? ( ~dev-python/aiopegelonline-0.0.10[${PYTHON_USEDEP}] )
	pencom? ( ~dev-python/pencompy-0.0.3[${PYTHON_USEDEP}] )
	permobil? ( ~dev-python/mypermobil-0.1.8[${PYTHON_USEDEP}] )
	philips_js? ( ~dev-python/ha-philipsjs-3.2.2[${PYTHON_USEDEP}] )
	picnic? ( ~dev-python/python-picnic-api-1.1.0[${PYTHON_USEDEP}] )
	pilight? ( ~dev-python/pilight-0.1.1[${PYTHON_USEDEP}] )
	ping? ( ~dev-python/icmplib-3.0[${PYTHON_USEDEP}] )
	pi_hole? ( ~dev-python/hole-0.8.0[${PYTHON_USEDEP}] )
	pjlink? ( ~dev-python/pypjlink2-1.2.1[${PYTHON_USEDEP}] )
	plaato? ( ~dev-python/pyplaato-0.0.18[${PYTHON_USEDEP}] )
	plex? ( ~dev-python/PlexAPI-4.15.16[${PYTHON_USEDEP}] ~dev-python/plexauth-0.0.6[${PYTHON_USEDEP}] ~dev-python/plexwebsocket-0.0.14[${PYTHON_USEDEP}] )
	plugwise? ( ~dev-python/plugwise-1.4.0[${PYTHON_USEDEP}] )
	plum_lightpad? ( ~dev-python/plumlightpad-0.0.11[${PYTHON_USEDEP}] )
	pocketcasts? ( ~dev-python/pycketcasts-1.0.1[${PYTHON_USEDEP}] )
	point? ( ~dev-python/pypoint-3.0.0[${PYTHON_USEDEP}] )
	poolsense? ( ~dev-python/poolsense-0.0.8[${PYTHON_USEDEP}] )
	powerwall? ( ~dev-python/tesla-powerwall-0.5.2[${PYTHON_USEDEP}] )
	private_ble_device? ( ~dev-python/bluetooth-data-tools-1.20.0[${PYTHON_USEDEP}] )
	profiler? ( ~dev-python/guppy3-3.1.4_p1[${PYTHON_USEDEP}] ~dev-python/objgraph-3.5.0[${PYTHON_USEDEP}] ~dev-python/pyprof2calltree-1.4.5[${PYTHON_USEDEP}] )
	progettihwsw? ( ~dev-python/ProgettiHWSW-0.1.3[${PYTHON_USEDEP}] )
	proliphix? ( ~dev-python/proliphix-0.4.1[${PYTHON_USEDEP}] )
	prometheus? ( ~dev-python/prometheus-client-0.21.0[${PYTHON_USEDEP}] )
	prosegur? ( ~dev-python/pyprosegur-0.0.9[${PYTHON_USEDEP}] )
	proxmoxve? ( ~dev-python/proxmoxer-2.0.1[${PYTHON_USEDEP}] )
	proxy? ( ~dev-python/pillow-10.4.0[${PYTHON_USEDEP}] )
	prusalink? ( ~dev-python/pyprusalink-2.1.1[${PYTHON_USEDEP}] )
	ps4? ( ~dev-python/pyps4-2ndscreen-1.3.1[${PYTHON_USEDEP}] )
	pulseaudio_loopback? ( ~dev-python/pulsectl-23.5.2[${PYTHON_USEDEP}] )
	pure_energie? ( ~dev-python/gridnet-5.0.1[${PYTHON_USEDEP}] )
	purpleair? ( ~dev-python/aiopurpleair-2022.12.1[${PYTHON_USEDEP}] )
	pushbullet? ( ~dev-python/pushbullet-py-0.11.0[${PYTHON_USEDEP}] )
	pushover? ( ~dev-python/pushover_complete-1.1.1[${PYTHON_USEDEP}] )
	pvoutput? ( ~dev-python/pvo-2.1.1[${PYTHON_USEDEP}] )
	pvpc_hourly_pricing? ( ~dev-python/aiopvpc-4.2.2[${PYTHON_USEDEP}] )
	python_script? ( ~dev-python/RestrictedPython-7.3[${PYTHON_USEDEP}] )
	qbittorrent? ( ~dev-python/qbittorrent-api-2024.2.59[${PYTHON_USEDEP}] )
	qingping? ( ~dev-python/qingping-ble-0.10.0[${PYTHON_USEDEP}] )
	qld_bushfire? ( ~dev-python/georss-qld-bushfire-alert-client-0.8[${PYTHON_USEDEP}] )
	qnap? ( ~dev-python/qnapstats-0.4.0[${PYTHON_USEDEP}] )
	qnap_qsw? ( ~dev-python/aioqsw-0.4.1[${PYTHON_USEDEP}] )
	qrcode? ( ~dev-python/pillow-10.4.0[${PYTHON_USEDEP}] ~dev-python/pyzbar-0.1.7[${PYTHON_USEDEP}] )
	quantum_gateway? ( ~dev-python/quantum-gateway-0.0.8[${PYTHON_USEDEP}] )
	qvr_pro? ( ~dev-python/pyqvrpro-0.52[${PYTHON_USEDEP}] )
	qwikswitch? ( ~dev-python/pyqwikswitch-0.93[${PYTHON_USEDEP}] )
	rabbitair? ( ~dev-python/python-rabbitair-0.0.8[${PYTHON_USEDEP}] )
	rachio? ( ~dev-python/RachioPy-1.1.0[${PYTHON_USEDEP}] )
	radiotherm? ( ~dev-python/radiotherm-2.1.0[${PYTHON_USEDEP}] )
	radio_browser? ( ~dev-python/radios-0.3.1[${PYTHON_USEDEP}] )
	rainbird? ( ~dev-python/pyrainbird-6.0.1[${PYTHON_USEDEP}] )
	raincloud? ( ~dev-python/raincloudy-0.0.7[${PYTHON_USEDEP}] )
	rainforest_eagle? ( ~dev-python/aioeagle-1.1.0[${PYTHON_USEDEP}] ~dev-python/eagle100-0.1.1[${PYTHON_USEDEP}] )
	rainforest_raven? ( ~dev-python/aioraven-0.7.0[${PYTHON_USEDEP}] )
	rainmachine? ( ~dev-python/regenmaschine-2024.3.0[${PYTHON_USEDEP}] )
	rapt_ble? ( ~dev-python/rapt-ble-0.1.2[${PYTHON_USEDEP}] )
	raspyrfm? ( ~dev-python/raspyrfm-client-1.2.8[${PYTHON_USEDEP}] )
	rdw? ( ~dev-python/vehicle-2.2.2[${PYTHON_USEDEP}] )
	recollect_waste? ( ~dev-python/aiorecollect-2023.9.0[${PYTHON_USEDEP}] )
	recorder? ( ~dev-python/sqlalchemy-2.0.31[${PYTHON_USEDEP}] ~dev-python/fnv-hash-fast-1.0.2[${PYTHON_USEDEP}] ~dev-python/psutil-home-assistant-0.0.1[${PYTHON_USEDEP}] )
	recswitch? ( ~dev-python/pyrecswitch-1.0.2[${PYTHON_USEDEP}] )
	reddit? ( ~dev-python/praw-7.5.0[${PYTHON_USEDEP}] )
	refoss? ( ~dev-python/refoss-ha-1.2.4[${PYTHON_USEDEP}] )
	rejseplanen? ( ~dev-python/rjpl-0.3.6[${PYTHON_USEDEP}] )
	remember_the_milk? ( ~dev-python/RtmAPI-0.7.2[${PYTHON_USEDEP}] ~dev-python/httplib2-0.20.4[${PYTHON_USEDEP}] )
	remote_rpi_gpio? ( ~dev-python/gpiozero-1.6.2[${PYTHON_USEDEP}] ~dev-python/pigpio-1.78[${PYTHON_USEDEP}] )
	renault? ( ~dev-python/renault-api-0.2.7[${PYTHON_USEDEP}] )
	renson? ( ~dev-python/renson-endura-delta-1.7.1[${PYTHON_USEDEP}] )
	reolink? ( ~dev-python/reolink-aio-0.9.11[${PYTHON_USEDEP}] )
	repetier? ( ~dev-python/pyrepetierng-0.1.0[${PYTHON_USEDEP}] )
	rest? ( ~dev-python/jsonpath-0.82.2[${PYTHON_USEDEP}] ~dev-python/xmltodict-0.13.0[${PYTHON_USEDEP}] )
	rflink? ( ~dev-python/rflink-0.0.66[${PYTHON_USEDEP}] )
	rfxtrx? ( ~dev-python/pyRFXtrx-0.31.1[${PYTHON_USEDEP}] )
	ridwell? ( ~dev-python/aioridwell-2024.1.0[${PYTHON_USEDEP}] )
	ring? ( ~dev-python/ring-doorbell-0.9.8[${PYTHON_USEDEP}] )
	ripple? ( ~dev-python/python-ripple-api-0.0.3[${PYTHON_USEDEP}] )
	risco? ( ~dev-python/pyrisco-0.6.4[${PYTHON_USEDEP}] )
	rituals_perfume_genie? ( ~dev-python/pyrituals-0.0.6[${PYTHON_USEDEP}] )
	rmvtransport? ( ~dev-python/PyRMVtransport-0.3.3[${PYTHON_USEDEP}] )
	rocketchat? ( ~dev-python/rocketchat-API-0.6.1[${PYTHON_USEDEP}] )
	roku? ( ~dev-python/rokuecp-0.19.3[${PYTHON_USEDEP}] )
	romy? ( ~dev-python/romy-0.0.10[${PYTHON_USEDEP}] )
	roomba? ( ~dev-python/roombapy-1.8.1[${PYTHON_USEDEP}] )
	roon? ( ~dev-python/roonapi-0.1.6[${PYTHON_USEDEP}] )
	route53? ( ~dev-python/boto3-1.34.131[${PYTHON_USEDEP}] )
	rova? ( ~dev-python/rova-0.4.1[${PYTHON_USEDEP}] )
	rpi_power? ( ~dev-python/rpi-bad-power-0.1.0[${PYTHON_USEDEP}] )
	rtsp_to_webrtc? ( ~dev-python/rtsp-to-webrtc-0.5.1[${PYTHON_USEDEP}] )
	ruckus_unleashed? ( ~dev-python/aioruckus-0.41[${PYTHON_USEDEP}] )
	russound_rio? ( ~dev-python/aiorussound-4.0.5[${PYTHON_USEDEP}] )
	russound_rnet? ( ~dev-python/russound-0.1.9[${PYTHON_USEDEP}] )
	ruuvitag_ble? ( ~dev-python/ruuvitag-ble-0.1.2[${PYTHON_USEDEP}] )
	ruuvi_gateway? ( ~dev-python/aioruuvigateway-0.1.0[${PYTHON_USEDEP}] )
	rympro? ( ~dev-python/pyrympro-0.0.8[${PYTHON_USEDEP}] )
	sabnzbd? ( ~dev-python/pysabnzbd-1.1.1[${PYTHON_USEDEP}] )
	saj? ( ~dev-python/pysaj-0.0.16[${PYTHON_USEDEP}] )
	samsungtv? ( ~dev-python/async-upnp-client-0.40.0[${PYTHON_USEDEP}] ~dev-python/getmac-0.9.4[${PYTHON_USEDEP}] ~dev-python/samsungctl-0.7.1[websocket,${PYTHON_USEDEP}] ~dev-python/samsungtvws-2.6.0[async,encrypted,${PYTHON_USEDEP}] ~dev-python/wakeonlan-2.1.0[${PYTHON_USEDEP}] )
	sanix? ( ~dev-python/sanix-1.0.6[${PYTHON_USEDEP}] )
	satel_integra? ( ~dev-python/satel-integra-0.3.7[${PYTHON_USEDEP}] )
	schlage? ( ~dev-python/pyschlage-2024.8.0[${PYTHON_USEDEP}] )
	schluter? ( ~dev-python/py-schluter-0.1.7[${PYTHON_USEDEP}] )
	scrape? ( ~dev-python/beautifulsoup4-4.12.3[${PYTHON_USEDEP}] ~dev-python/lxml-5.3.0[${PYTHON_USEDEP}] )
	screenlogic? ( ~dev-python/screenlogicpy-0.10.0[${PYTHON_USEDEP}] )
	scsgate? ( ~dev-python/scsgate-0.1.0[${PYTHON_USEDEP}] )
	season? ( ~dev-python/ephem-4.1.5[${PYTHON_USEDEP}] )
	sendgrid? ( ~dev-python/sendgrid-6.8.2[${PYTHON_USEDEP}] )
	sense? ( ~dev-python/sense-energy-0.12.4[${PYTHON_USEDEP}] )
	sensibo? ( ~dev-python/pysensibo-1.1.0[${PYTHON_USEDEP}] )
	sensirion_ble? ( ~dev-python/sensirion-ble-0.1.1[${PYTHON_USEDEP}] )
	sensorpro? ( ~dev-python/sensorpro-ble-0.5.3[${PYTHON_USEDEP}] )
	sensorpush? ( ~dev-python/sensorpush-ble-1.6.2[${PYTHON_USEDEP}] )
	sentry? ( ~dev-python/sentry-sdk-1.40.3[${PYTHON_USEDEP}] )
	senz? ( ~dev-python/aiosenz-1.0.0[${PYTHON_USEDEP}] )
	serial? ( ~dev-python/pyserial-asyncio-fast-0.13[${PYTHON_USEDEP}] )
	serial_pm? ( ~dev-python/pmsensor-0.4[${PYTHON_USEDEP}] )
	sesame? ( ~dev-python/pysesame2-1.0.1[${PYTHON_USEDEP}] )
	seventeentrack? ( ~dev-python/pyseventeentrack-1.0.1[${PYTHON_USEDEP}] )
	seven_segments? ( ~dev-python/pillow-10.4.0[${PYTHON_USEDEP}] )
	sfr_box? ( ~dev-python/sfrbox-api-0.0.11[${PYTHON_USEDEP}] )
	sharkiq? ( ~dev-python/sharkiq-1.0.2[${PYTHON_USEDEP}] )
	shelly? ( ~dev-python/aioshelly-11.4.2[${PYTHON_USEDEP}] )
	shodan? ( ~net-analyzer/shodan-1.28.0[${PYTHON_USEDEP}] )
	sia? ( ~dev-python/pysiaalarm-3.1.1[${PYTHON_USEDEP}] )
	sighthound? ( ~dev-python/pillow-10.4.0[${PYTHON_USEDEP}] ~dev-python/simplehound-0.3[${PYTHON_USEDEP}] )
	signal_messenger? ( ~dev-python/pysignalclirestapi-0.3.24[${PYTHON_USEDEP}] )
	simplepush? ( ~dev-python/simplepush-2.2.3[${PYTHON_USEDEP}] )
	simplisafe? ( ~dev-python/simplisafe-python-2024.1.0[${PYTHON_USEDEP}] )
	sinch? ( ~dev-python/clx-sdk-xms-1.0.0[${PYTHON_USEDEP}] )
	sisyphus? ( ~dev-python/sisyphus-control-3.1.4[${PYTHON_USEDEP}] )
	skybeacon? ( ~dev-python/pygatt-4.0.5[GATTTOOL,${PYTHON_USEDEP}] )
	skybell? ( ~dev-python/aioskybell-22.7.0[${PYTHON_USEDEP}] )
	sky_hub? ( ~dev-python/pyskyqhub-0.1.4[${PYTHON_USEDEP}] )
	slack? ( ~dev-python/slackclient-2.5.0[${PYTHON_USEDEP}] )
	sleepiq? ( ~dev-python/asyncsleepiq-1.5.2[${PYTHON_USEDEP}] )
	slide? ( ~dev-python/goslide-api-0.5.1[${PYTHON_USEDEP}] )
	slimproto? ( ~dev-python/aioslimproto-3.0.0[${PYTHON_USEDEP}] )
	sma? ( ~dev-python/pysma-0.7.3[${PYTHON_USEDEP}] )
	smappee? ( ~dev-python/pysmappee-0.2.29[${PYTHON_USEDEP}] )
	smartthings? ( ~dev-python/pysmartapp-0.3.5[${PYTHON_USEDEP}] ~dev-python/pysmartthings-0.7.8[${PYTHON_USEDEP}] )
	smarttub? ( ~dev-python/python-smarttub-0.0.36[${PYTHON_USEDEP}] )
	smarty? ( ~dev-python/pysmarty2-0.10.1[${PYTHON_USEDEP}] )
	smart_meter_texas? ( ~dev-python/smart-meter-texas-0.5.5[${PYTHON_USEDEP}] )
	smhi? ( ~dev-python/smhi-pkg-1.0.16[${PYTHON_USEDEP}] )
	sms? ( ~dev-python/python-gc100-1.0.3_alpha0[${PYTHON_USEDEP}] )
	snapcast? ( ~dev-python/snapcast-2.3.6[${PYTHON_USEDEP}] )
	snmp? ( ~dev-python/pysnmp-6.2.6[${PYTHON_USEDEP}] )
	snooz? ( ~dev-python/pysnooz-0.8.6[${PYTHON_USEDEP}] )
	solaredge? ( ~dev-python/aiosolaredge-0.2.0[${PYTHON_USEDEP}] ~dev-python/stringcase-1.2.0[${PYTHON_USEDEP}] )
	solaredge_local? ( ~dev-python/solaredge-local-0.2.3[${PYTHON_USEDEP}] )
	solarlog? ( ~dev-python/solarlog_cli-0.3.2[${PYTHON_USEDEP}] )
	solax? ( ~dev-python/solax-3.1.1[${PYTHON_USEDEP}] )
	soma? ( ~dev-python/pysoma-0.0.12[${PYTHON_USEDEP}] )
	somfy_mylink? ( ~dev-python/somfy-mylink-synergy-1.0.6[${PYTHON_USEDEP}] )
	sonarr? ( ~dev-python/aiopyarr-23.4.0[${PYTHON_USEDEP}] )
	songpal? ( ~dev-python/python-songpal-0.16.2[${PYTHON_USEDEP}] )
	sonos? ( ~dev-python/soco-0.30.4[${PYTHON_USEDEP}] ~dev-python/sonos-websocket-0.1.3[${PYTHON_USEDEP}] )
	sony_projector? ( ~dev-python/pySDCP-1[${PYTHON_USEDEP}] )
	soundtouch? ( ~dev-python/libsoundtouch-0.8.0[${PYTHON_USEDEP}] )
	spc? ( ~dev-python/pyspcwebgw-0.7.0[${PYTHON_USEDEP}] )
	speedtestdotnet? ( ~net-analyzer/speedtest-cli-2.1.3[${PYTHON_USEDEP}] )
	spider? ( ~dev-python/spiderpy-1.6.1[${PYTHON_USEDEP}] )
	splunk? ( ~dev-python/hass-splunk-0.1.1[${PYTHON_USEDEP}] )
	spotify? ( ~dev-python/spotipy-2.23.0[${PYTHON_USEDEP}] )
	sql? ( ~dev-python/sqlalchemy-2.0.31[${PYTHON_USEDEP}] ~dev-python/sqlparse-0.5.0[${PYTHON_USEDEP}] )
	squeezebox? ( ~dev-python/pysqueezebox-0.9.3[${PYTHON_USEDEP}] )
	srp_energy? ( ~dev-python/srpenergy-1.3.6[${PYTHON_USEDEP}] )
	ssdp? ( ~dev-python/async-upnp-client-0.40.0[${PYTHON_USEDEP}] )
	starline? ( ~dev-python/starline-0.1.5[${PYTHON_USEDEP}] )
	starlingbank? ( ~dev-python/starlingbank-3.2[${PYTHON_USEDEP}] )
	starlink? ( ~dev-python/starlink-grpc-core-1.1.3[${PYTHON_USEDEP}] )
	startca? ( ~dev-python/xmltodict-0.13.0[${PYTHON_USEDEP}] )
	statsd? ( ~dev-python/statsd-3.2.1[${PYTHON_USEDEP}] )
	steamist? ( ~dev-python/aiosteamist-1.0.0[${PYTHON_USEDEP}] ~dev-python/discovery30303-0.3.2[${PYTHON_USEDEP}] )
	steam_online? ( ~dev-python/steamodd-4.21[${PYTHON_USEDEP}] )
	stookalert? ( ~dev-python/stookalert-0.1.4[${PYTHON_USEDEP}] )
	stookwijzer? ( ~dev-python/stookwijzer-1.3.0[${PYTHON_USEDEP}] )
	stream? ( ~dev-python/PyTurboJPEG-1.7.5[${PYTHON_USEDEP}] ~dev-python/ha-av-10.1.1[${PYTHON_USEDEP}] ~dev-python/numpy-1.26.4[${PYTHON_USEDEP}] )
	streamlabswater? ( ~dev-python/streamlabswater-1.0.1[${PYTHON_USEDEP}] )
	subaru? ( ~dev-python/subarulink-0.7.11[${PYTHON_USEDEP}] )
	suez_water? ( ~dev-python/pysuez-0.2.0[${PYTHON_USEDEP}] )
	sunweg? ( ~dev-python/sunweg-3.0.2[${PYTHON_USEDEP}] )
	supla? ( ~dev-python/asyncpysupla-0.0.5[${PYTHON_USEDEP}] )
	surepetcare? ( ~dev-python/surepy-0.9.0[${PYTHON_USEDEP}] )
	swiss_hydrological_data? ( ~dev-python/swisshydrodata-0.1.0[${PYTHON_USEDEP}] )
	swiss_public_transport? ( ~dev-python/python-opendata-transport-0.4.0[${PYTHON_USEDEP}] )
	switchbee? ( ~dev-python/pyswitchbee-1.8.3[${PYTHON_USEDEP}] )
	switchbot? ( ~dev-python/PySwitchbot-0.48.2[${PYTHON_USEDEP}] )
	switchbot_cloud? ( ~dev-python/switchbot-api-2.2.1[${PYTHON_USEDEP}] )
	switcher_kis? ( ~dev-python/aioswitcher-4.0.3[${PYTHON_USEDEP}] )
	switchmate? ( ~dev-python/PySwitchmate-0.5.1[${PYTHON_USEDEP}] )
	syncthing? ( ~dev-python/aiosyncthing-0.5.1[${PYTHON_USEDEP}] )
	syncthru? ( ~dev-python/PySyncThru-0.7.10[${PYTHON_USEDEP}] ~dev-python/url-normalize-1.4.3[${PYTHON_USEDEP}] )
	synology_dsm? ( ~dev-python/py-synologydsm-api-2.5.3[${PYTHON_USEDEP}] )
	synology_srm? ( ~dev-python/synology-srm-0.2.0[${PYTHON_USEDEP}] )
	systemmonitor? ( ~dev-python/psutil-home-assistant-0.0.1[${PYTHON_USEDEP}] ~dev-python/psutil-6.0.0[${PYTHON_USEDEP}] )
	system_bridge? ( ~dev-python/systembridgeconnector-4.1.5[${PYTHON_USEDEP}] ~dev-python/systembridgemodels-4.2.4[${PYTHON_USEDEP}] )
	tado? ( ~dev-python/python-tado-0.17.6[${PYTHON_USEDEP}] )
	tailscale? ( ~dev-python/tailscale-0.6.1[${PYTHON_USEDEP}] )
	tailwind? ( ~dev-python/gotailwind-0.2.4[${PYTHON_USEDEP}] )
	tami4? ( ~dev-python/Tami4EdgeAPI-3.0[${PYTHON_USEDEP}] )
	tankerkoenig? ( ~dev-python/aiotankerkoenig-0.4.2[${PYTHON_USEDEP}] )
	tank_utility? ( ~dev-python/tank-utility-1.5.0[${PYTHON_USEDEP}] )
	tapsaff? ( ~dev-python/tapsaff-0.2.1[${PYTHON_USEDEP}] )
	tasmota? ( ~dev-python/HATasmota-0.9.2[${PYTHON_USEDEP}] )
	tautulli? ( ~dev-python/pytautulli-23.1.1[${PYTHON_USEDEP}] )
	technove? ( ~dev-python/python-technove-1.3.1[${PYTHON_USEDEP}] )
	ted5000? ( ~dev-python/xmltodict-0.13.0[${PYTHON_USEDEP}] )
	tedee? ( ~dev-python/pytedee-async-0.2.20[${PYTHON_USEDEP}] )
	telegram_bot? ( ~dev-python/python-telegram-bot-21.5[socks,${PYTHON_USEDEP}] )
	tellduslive? ( ~dev-python/tellduslive-0.10.12[${PYTHON_USEDEP}] )
	tellstick? ( ~dev-python/tellcore-net-0.4[${PYTHON_USEDEP}] ~dev-python/tellcore-py-1.1.2[${PYTHON_USEDEP}] )
	temper? ( ~dev-python/temperusb-1.6.1[${PYTHON_USEDEP}] )
	tesla_wall_connector? ( ~dev-python/tesla-wall-connector-1.0.2[${PYTHON_USEDEP}] )
	teslemetry? ( ~dev-python/tesla-fleet-api-0.7.8[${PYTHON_USEDEP}] )
	tessie? ( ~dev-python/tesla-fleet-api-0.7.8[${PYTHON_USEDEP}] ~dev-python/tessie-api-0.1.1[${PYTHON_USEDEP}] )
	thermobeacon? ( ~dev-python/thermobeacon-ble-0.7.0[${PYTHON_USEDEP}] )
	thermopro? ( ~dev-python/thermopro-ble-0.10.0[${PYTHON_USEDEP}] )
	thingspeak? ( ~dev-python/thingspeak-1.0.0[${PYTHON_USEDEP}] )
	thinkingcleaner? ( ~dev-python/pythinkingcleaner-0.0.3[${PYTHON_USEDEP}] )
	thread? ( ~dev-python/pyroute2-0.7.5[${PYTHON_USEDEP}] ~dev-python/python-otbr-api-2.6.0[${PYTHON_USEDEP}] )
	tibber? ( ~dev-python/pyTibber-0.30.3[${PYTHON_USEDEP}] )
	tikteck? ( ~dev-python/tikteck-0.4[${PYTHON_USEDEP}] )
	tile? ( ~dev-python/pytile-2023.12.0[${PYTHON_USEDEP}] )
	tilt_ble? ( ~dev-python/tilt-ble-0.2.3[${PYTHON_USEDEP}] )
	tmb? ( ~dev-python/tmb-0.0.4[${PYTHON_USEDEP}] )
	todoist? ( ~dev-python/todoist-api-python-2.1.2[${PYTHON_USEDEP}] )
	tolo? ( ~dev-python/tololib-1.1.0[${PYTHON_USEDEP}] )
	tomorrowio? ( ~dev-python/pytomorrowio-0.3.6[${PYTHON_USEDEP}] )
	toon? ( ~dev-python/toonapi-0.3.0[${PYTHON_USEDEP}] )
	totalconnect? ( ~dev-python/total-connect-client-2024.5[${PYTHON_USEDEP}] )
	touchline? ( ~dev-python/pytouchline-0.7[${PYTHON_USEDEP}] )
	tplink? ( ~dev-python/python-kasa-0.7.5[speedups,${PYTHON_USEDEP}] )
	tplink_lte? ( ~dev-python/tp-connected-0.0.4[${PYTHON_USEDEP}] )
	tplink_omada? ( ~dev-python/tplink-omada-client-1.4.2[${PYTHON_USEDEP}] )
	traccar? ( ~dev-python/pytraccar-2.1.1[${PYTHON_USEDEP}] ~dev-python/stringcase-1.2.0[${PYTHON_USEDEP}] )
	traccar_server? ( ~dev-python/pytraccar-2.1.1[${PYTHON_USEDEP}] )
	tractive? ( ~dev-python/aiotractive-0.6.0[${PYTHON_USEDEP}] )
	tradfri? ( ~dev-python/pytradfri-9.0.1[async,${PYTHON_USEDEP}] )
	trafikverket_camera? ( ~dev-python/pytrafikverket-1.0.0[${PYTHON_USEDEP}] )
	trafikverket_ferry? ( ~dev-python/pytrafikverket-1.0.0[${PYTHON_USEDEP}] )
	trafikverket_train? ( ~dev-python/pytrafikverket-1.0.0[${PYTHON_USEDEP}] )
	trafikverket_weatherstation? ( ~dev-python/pytrafikverket-1.0.0[${PYTHON_USEDEP}] )
	transmission? ( ~dev-python/transmission-rpc-7.0.3[${PYTHON_USEDEP}] )
	transport_nsw? ( ~dev-python/PyTransportNSW-0.1.1[${PYTHON_USEDEP}] )
	travisci? ( ~dev-python/TravisPy-0.3.5[${PYTHON_USEDEP}] )
	trend? ( ~dev-python/numpy-1.26.4[${PYTHON_USEDEP}] )
	tts? ( ~media-libs/mutagen-1.47.0[${PYTHON_USEDEP}] )
	tuya? ( ~dev-python/tuya-device-sharing-sdk-0.1.9[${PYTHON_USEDEP}] )
	twentemilieu? ( ~dev-python/twentemilieu-2.0.1[${PYTHON_USEDEP}] )
	twilio? ( ~dev-python/twilio-6.32.0[${PYTHON_USEDEP}] )
	twinkly? ( ~dev-python/ttls-1.8.3[${PYTHON_USEDEP}] )
	twitch? ( ~dev-python/twitchAPI-4.2.1[${PYTHON_USEDEP}] )
	twitter? ( ~dev-python/TwitterAPI-2.7.12[${PYTHON_USEDEP}] )
	ubus? ( ~dev-python/openwrt-ubus-rpc-0.0.2[${PYTHON_USEDEP}] )
	ukraine_alarm? ( ~dev-python/uasiren-0.0.1[${PYTHON_USEDEP}] )
	unifi? ( ~dev-python/aiounifi-80[${PYTHON_USEDEP}] )
	unifiled? ( ~dev-python/unifiled-0.11[${PYTHON_USEDEP}] )
	unifiprotect? ( ~dev-python/uiprotect-6.1.0[${PYTHON_USEDEP}] ~dev-python/unifi-discovery-1.2.0[${PYTHON_USEDEP}] )
	unifi_direct? ( ~dev-python/unifi-ap-0.0.1[${PYTHON_USEDEP}] )
	upb? ( ~dev-python/upb-lib-0.5.8[${PYTHON_USEDEP}] )
	upcloud? ( ~dev-python/upcloud-api-2.5.1[${PYTHON_USEDEP}] )
	upc_connect? ( ~dev-python/connect-box-0.3.1[${PYTHON_USEDEP}] )
	upnp? ( ~dev-python/async-upnp-client-0.40.0[${PYTHON_USEDEP}] ~dev-python/getmac-0.9.4[${PYTHON_USEDEP}] )
	uptimerobot? ( ~dev-python/pyuptimerobot-22.2.0[${PYTHON_USEDEP}] )
	usb? ( ~dev-python/pyserial-3.5[${PYTHON_USEDEP}] ~dev-python/pyudev-0.24.1[${PYTHON_USEDEP}] )
	usgs_earthquakes_feed? ( ~dev-python/aio-geojson-usgs-earthquakes-0.3[${PYTHON_USEDEP}] )
	utility_meter? ( ~dev-python/croniter-2.0.2[${PYTHON_USEDEP}] )
	uvc? ( ~dev-python/uvcclient-0.12.1[${PYTHON_USEDEP}] )
	v2c? ( ~dev-python/pytrydan-0.8.0[${PYTHON_USEDEP}] )
	vallox? ( ~dev-python/vallox-websocket-api-5.3.0[${PYTHON_USEDEP}] )
	vasttrafik? ( ~dev-python/vtjp-0.2.1[${PYTHON_USEDEP}] )
	velbus? ( ~dev-python/velbus-aio-2024.7.6[${PYTHON_USEDEP}] )
	velux? ( ~dev-python/pyvlx-0.2.21[${PYTHON_USEDEP}] )
	venstar? ( ~dev-python/venstarcolortouch-0.19[${PYTHON_USEDEP}] )
	vera? ( ~dev-python/pyvera-0.3.13[${PYTHON_USEDEP}] )
	verisure? ( ~dev-python/vsure-2.6.6[${PYTHON_USEDEP}] )
	versasense? ( ~dev-python/pyversasense-0.0.6[${PYTHON_USEDEP}] )
	version? ( ~dev-python/pyhaversion-22.8.0[${PYTHON_USEDEP}] )
	vesync? ( ~dev-python/pyvesync-2.1.12[${PYTHON_USEDEP}] )
	vicare? ( ~dev-python/PyViCare-2.34.0[${PYTHON_USEDEP}] )
	vilfo? ( ~dev-python/vilfo-api-client-0.5.0[${PYTHON_USEDEP}] )
	vivotek? ( ~dev-python/libpyvivotek-0.4.0[${PYTHON_USEDEP}] )
	vizio? ( ~dev-python/pyvizio-0.1.61[${PYTHON_USEDEP}] )
	vlc? ( ~dev-python/python-vlc-3.0.18122[${PYTHON_USEDEP}] )
	vlc_telnet? ( ~dev-python/aiovlc-0.5.1[${PYTHON_USEDEP}] )
	vodafone_station? ( ~dev-python/aiovodafone-0.6.0[${PYTHON_USEDEP}] )
	voip? ( ~dev-python/voip-utils-0.1.0[${PYTHON_USEDEP}] )
	volkszaehler? ( ~dev-python/volkszaehler-0.4.0[${PYTHON_USEDEP}] )
	volumio? ( ~dev-python/pyvolumio-0.1.5[${PYTHON_USEDEP}] )
	volvooncall? ( ~dev-python/volvooncall-0.10.3[${PYTHON_USEDEP}] )
	vulcan? ( ~dev-python/vulcan-api-2.3.2[${PYTHON_USEDEP}] )
	vultr? ( ~dev-python/vultr-0.1.2[${PYTHON_USEDEP}] )
	w800rf32? ( ~dev-python/pyW800rf32-0.4[${PYTHON_USEDEP}] )
	wake_on_lan? ( ~dev-python/wakeonlan-2.1.0[${PYTHON_USEDEP}] )
	wallbox? ( ~dev-python/wallbox-0.7.0[${PYTHON_USEDEP}] )
	waqi? ( ~dev-python/aiowaqi-3.1.0[${PYTHON_USEDEP}] )
	waterfurnace? ( ~dev-python/waterfurnace-1.1.0[${PYTHON_USEDEP}] )
	watson_iot? ( ~dev-python/ibmiotf-0.3.4[${PYTHON_USEDEP}] )
	watttime? ( ~dev-python/aiowatttime-0.1.1[${PYTHON_USEDEP}] )
	waze_travel_time? ( ~dev-python/pywaze-1.0.2[${PYTHON_USEDEP}] )
	weatherflow? ( ~dev-python/pyweatherflowudp-1.4.5[${PYTHON_USEDEP}] )
	weatherflow_cloud? ( ~dev-python/weatherflow4py-1.0.6[${PYTHON_USEDEP}] )
	weatherkit? ( ~dev-python/apple_weatherkit-1.1.2[${PYTHON_USEDEP}] )
	webmin? ( ~dev-python/webmin-xmlrpc-0.0.2[${PYTHON_USEDEP}] )
	webostv? ( ~dev-python/aiowebostv-0.4.2[${PYTHON_USEDEP}] )
	wemo? ( ~dev-python/pywemo-1.4.0[${PYTHON_USEDEP}] )
	whirlpool? ( ~dev-python/whirlpool-sixth-sense-0.18.8[${PYTHON_USEDEP}] )
	whois? ( ~dev-python/whois-0.9.27[${PYTHON_USEDEP}] )
	wiffi? ( ~dev-python/wiffi-1.1.2[${PYTHON_USEDEP}] )
	wilight? ( ~dev-python/pywilight-0.0.74[${PYTHON_USEDEP}] )
	wirelesstag? ( ~dev-python/wirelesstagpy-0.8.1[${PYTHON_USEDEP}] )
	withings? ( ~dev-python/aiowithings-3.0.3[${PYTHON_USEDEP}] )
	wiz? ( ~dev-python/pywizlight-0.5.14[${PYTHON_USEDEP}] )
	wled? ( ~dev-python/wled-0.20.2[${PYTHON_USEDEP}] )
	wolflink? ( ~dev-python/wolf-comm-0.0.15[${PYTHON_USEDEP}] )
	workday? ( ~dev-python/holidays-0.58[${PYTHON_USEDEP}] )
	ws66i? ( ~dev-python/pyws66i-1.1[${PYTHON_USEDEP}] )
	xbox? ( ~dev-python/xbox-webapi-2.0.11[${PYTHON_USEDEP}] )
	xeoma? ( ~dev-python/pyxeoma-1.4.1[${PYTHON_USEDEP}] )
	xiaomi_aqara? ( ~dev-python/PyXiaomiGateway-0.14.3[${PYTHON_USEDEP}] )
	xiaomi_ble? ( ~dev-python/xiaomi-ble-0.32.0[${PYTHON_USEDEP}] )
	xiaomi_miio? ( ~dev-python/construct-2.10.68[${PYTHON_USEDEP}] ~dev-python/micloud-0.5[${PYTHON_USEDEP}] ~dev-python/python-miio-0.5.12[${PYTHON_USEDEP}] )
	xiaomi_tv? ( ~dev-python/pymitv-1.4.3[${PYTHON_USEDEP}] )
	xmpp? ( ~dev-python/emoji-2.8.0[${PYTHON_USEDEP}] ~dev-python/slixmpp-1.8.5[${PYTHON_USEDEP}] )
	xs1? ( ~dev-python/xs1-api-client-3.0.0[${PYTHON_USEDEP}] )
	yalexs_ble? ( ~dev-python/yalexs-ble-2.4.3[${PYTHON_USEDEP}] )
	yale_smart_alarm? ( ~dev-python/yalesmartalarmclient-0.4.3[${PYTHON_USEDEP}] )
	yamaha? ( ~dev-python/rxv-0.7.0[${PYTHON_USEDEP}] )
	yamaha_musiccast? ( ~dev-python/aiomusiccast-0.14.8[${PYTHON_USEDEP}] )
	yandex_transport? ( ~dev-python/aioymaps-1.2.5[${PYTHON_USEDEP}] )
	yardian? ( ~dev-python/pyyardian-1.1.1[${PYTHON_USEDEP}] )
	yeelight? ( ~dev-python/async-upnp-client-0.40.0[${PYTHON_USEDEP}] ~dev-python/yeelight-0.7.14[${PYTHON_USEDEP}] )
	yeelightsunflower? ( ~dev-python/yeelightsunflower-0.0.10[${PYTHON_USEDEP}] )
	yi? ( ~dev-python/aioftp-0.21.3[${PYTHON_USEDEP}] )
	yolink? ( ~dev-python/yolink-api-0.4.7[${PYTHON_USEDEP}] )
	youless? ( ~dev-python/youless-api-2.1.2[${PYTHON_USEDEP}] )
	youtube? ( ~dev-python/youtubeaio-1.1.5[${PYTHON_USEDEP}] )
	zabbix? ( ~dev-python/py-zabbix-1.1.7[${PYTHON_USEDEP}] )
	zamg? ( ~dev-python/zamg-0.3.6[${PYTHON_USEDEP}] )
	zengge? ( ~dev-python/bluetooth-adapters-0.19.4[${PYTHON_USEDEP}] ~dev-python/zengge-0.2[${PYTHON_USEDEP}] )
	zeroconf? ( ~dev-python/zeroconf-0.135.0[${PYTHON_USEDEP}] )
	zerproc? ( ~dev-python/pyzerproc-0.4.8[${PYTHON_USEDEP}] )
	zestimate? ( ~dev-python/xmltodict-0.13.0[${PYTHON_USEDEP}] )
	zeversolar? ( ~dev-python/zeversolar-0.3.1[${PYTHON_USEDEP}] )
	zha? ( ~dev-python/universal-silabs-flasher-0.0.22[${PYTHON_USEDEP}] ~dev-python/zha-0.0.34[${PYTHON_USEDEP}] )
	zhong_hong? ( ~dev-python/zhong-hong-hvac-1.0.12[${PYTHON_USEDEP}] )
	ziggo_mediabox_xl? ( ~dev-python/ziggo-mediabox-xl-1.1.0[${PYTHON_USEDEP}] )
	zoneminder? ( ~dev-python/zm-py-0.5.4[${PYTHON_USEDEP}] )
	zwave_js? ( ~dev-python/pyserial-3.5[${PYTHON_USEDEP}] ~dev-python/zwave-js-server-python-0.58.1[${PYTHON_USEDEP}] )
	zwave_me? ( ~dev-python/url-normalize-1.4.3[${PYTHON_USEDEP}] ~dev-python/zwave-me-ws-0.4.3[${PYTHON_USEDEP}] )
"

BDEPEND="${RDEPEND}
	test? (
		dev-python/astroid[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/freezegun[${PYTHON_USEDEP}]
		dev-python/mock-open[${PYTHON_USEDEP}]
		dev-python/mypy-dev[${PYTHON_USEDEP}]
		dev-python/pipdeptree[${PYTHON_USEDEP}]
		dev-vcs/pre-commit
		dev-python/pylint-per-file-ignores[${PYTHON_USEDEP}]
		dev-python/pylint[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-freezer[${PYTHON_USEDEP}]
		dev-python/pytest-github-actions-annotate-failures[${PYTHON_USEDEP}]
		dev-python/pytest-picked[${PYTHON_USEDEP}]
		dev-python/pytest-socket[${PYTHON_USEDEP}]
		dev-python/pytest-sugar[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-unordered[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/requests-mock[${PYTHON_USEDEP}]
		dev-python/respx[${PYTHON_USEDEP}]
		dev-python/syrupy[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
	)
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/mock[${PYTHON_USEDEP}]"

src_prepare() {
    if use test ; then
        cp --no-preserve=mode --recursive ${WORKDIR}/core-${MY_PV}/tests ${S}
		chmod u+x ${S}/tests/auth/providers/test_command_line_cmd.sh
    fi
    sed -E -i "s/regex==[^ ]*/regex/g" -i homeassistant/package_constraints.txt || die

    distutils-r1_src_prepare
}
INSTALL_DIR="/opt/${MY_PN}"

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
The HA interface listens on port 8123
hass configuration is in: /etc/${MY_PN}
daemon command line arguments are configured in: /etc/conf.d/${MY_PN}
logging is to: /var/log/${MY_PN}/{server,errors,stdout}.log
The sqlite db is by default in: /etc/${MY_PN}
support at https://git.edevau.net/onkelbeh/HomeAssistantRepository
"

DOCS="README.rst"

python_install_all() {
	dodoc ${DOCS}
	distutils-r1_python_install_all
	keepdir "$INSTALL_DIR"
	keepdir "/etc/${MY_PN}"
	fowners -R "${MY_PN}:${MY_PN}" "/etc/${MY_PN}"
	keepdir "/var/log/${MY_PN}"
	fowners -R "${MY_PN}:${MY_PN}" "/var/log/${MY_PN}"
	newconfd "${FILESDIR}/${MY_PN}.conf.d" "${MY_PN}"
	newinitd "${FILESDIR}/${MY_PN}.init.d" "${MY_PN}"
	use systemd && systemd_dounit "${FILESDIR}/${MY_PN}.service"
	dobin "${FILESDIR}/hasstest"
	if use socat ; then
		newinitd "${FILESDIR}/socat-zwave.init.d" "socat-zwave"
		sed -i -e 's/# need socat-zwave/need socat-zwave/g' "${D}/etc/init.d/${MY_PN}" || die
	fi
	if use mqtt ; then
		sed -i -e 's/# need mosquitto/need mosquitto/g' "${D}/etc/init.d/${MY_PN}" || die
	fi
	insinto /etc/logrotate.d
	newins "${FILESDIR}/${MY_PN}.logrotate" "${MY_PN}"
	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}

distutils_enable_tests pytest