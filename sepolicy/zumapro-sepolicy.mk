# ConnectivityThermalPowerManager
BOARD_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/connectivity_thermal_power_manager

# GNSS
BOARD_SEPOLICY_DIRS += \
    device/google/gs-common/gps/lsi/sepolicy \
    device/google/gs-common/gps/pixel/sepolicy

# google_battery service
BOARD_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/googlebattery

# sepolicy that are shared among devices using zumapro
BOARD_SEPOLICY_DIRS += device/google/zumapro/sepolicy/aam
BOARD_SEPOLICY_DIRS += device/google/zumapro/sepolicy/vendor
BOARD_SEPOLICY_DIRS += device/google/zumapro/sepolicy/radio
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

