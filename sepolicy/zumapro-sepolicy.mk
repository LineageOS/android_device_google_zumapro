# ConnectivityThermalPowerManager
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/connectivity_thermal_power_manager

# GNSS
BOARD_SEPOLICY_DIRS += \
    device/google/gs-common/gps/lsi/sepolicy \
    device/google/gs-common/gps/pixel/sepolicy

# google_battery service
BOARD_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/googlebattery

# sepolicy that are shared among devices using zumapro
BOARD_SEPOLICY_DIRS += device/google/zumapro/sepolicy/vendor
BOARD_VENDOR_SEPOLICY_DIRS += device/google/zumapro/sepolicy/radio
PRODUCT_PRIVATE_SEPOLICY_DIRS += device/google/zumapro/sepolicy/radio/private

# unresolved SELinux error log with bug tracking
BOARD_SEPOLICY_DIRS += device/google/zumapro/sepolicy/tracking_denials

PRODUCT_PUBLIC_SEPOLICY_DIRS += device/google/zumapro/sepolicy/public
PRODUCT_PRIVATE_SEPOLICY_DIRS += device/google/zumapro/sepolicy/private

# system_ext
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += device/google/zumapro/sepolicy/system_ext/public
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += device/google/zumapro/sepolicy/system_ext/private

# PowerStats HAL
BOARD_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/powerstats

# To be reviewed and removed.
BOARD_SEPOLICY_DIRS += device/google/zumapro/sepolicy/legacy/whitechapel_pro
BOARD_SEPOLICY_DIRS += device/google/zumapro/sepolicy/legacy/zuma/vendor
PRODUCT_PRIVATE_SEPOLICY_DIRS += device/google/zumapro/sepolicy/legacy/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += device/google/zumapro/sepolicy/legacy/system_ext/public
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += device/google/zumapro/sepolicy/legacy/system_ext/private

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += device/google/gs-common/gs_watchdogd/sepolicy

BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/aoc/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/audio/sepolicy/aidl
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/audio/sepolicy/common
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/audio/sepolicy/hdmi_audio/drmdp
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/battery_mitigation/sepolicy/vendor
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/bcmbt/dump/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/bootctrl/sepolicy/aidl
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/camera/sepolicy/vendor
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/chre/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/dauntless/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/display/sepolicy/exynos
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/display_logbuffer/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/edgetpu/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/fingerprint/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/gear/dumpstate/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/gps/dump/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/gpu/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/gxp/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/input/gia/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/insmod/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/mediacodec/common/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/mediacodec/samsung/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/misc_writer
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/modem/dump_modemlog/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/modem/modem_svc_sit/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/nfc/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/pcie/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/performance/experiments/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/performance/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/pixel_metrics/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/pixel_ril/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/radio/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/ramdump_and_coredump/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/recorder/sepolicy/vendor
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/sensors/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/soc/sepolicy/freq
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/soc/sepolicy/soc
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/storage/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/storage/sepolicy/tracking_denials
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/telephony/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/thermal/sepolicy/dump
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/thermal/sepolicy/thermal_hal
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/touch/twoshay/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/trusty/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/zumapro/sepolicy/widevine

PRODUCT_PUBLIC_SEPOLICY_DIRS += device/google/gs-common/camera/sepolicy/product/public
PRODUCT_PRIVATE_SEPOLICY_DIRS += device/google/gs-common/camera/sepolicy/product/private

PRODUCT_PUBLIC_SEPOLICY_DIRS += device/google/gs-common/betterbug/sepolicy/product/public
PRODUCT_PRIVATE_SEPOLICY_DIRS += device/google/gs-common/betterbug/sepolicy/product/private

PRODUCT_PUBLIC_SEPOLICY_DIRS += device/google/gs-common/recorder/sepolicy/product/public
PRODUCT_PRIVATE_SEPOLICY_DIRS += device/google/gs-common/recorder/sepolicy/product/private

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += device/google/gs-common/battery_mitigation/sepolicy/system_ext/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += device/google/gs-common/battery_mitigation/sepolicy/system_ext/public

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += device/google/gs-common/sota_app/sepolicy/system_ext