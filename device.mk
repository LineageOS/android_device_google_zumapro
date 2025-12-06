#
# SPDX-FileCopyrightText: 2011 The Android Open-Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Disable OMX
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.media.omx=0

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.ipsec_tunnel_migration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnel_migration.xml

# sscoredump
PRODUCT_PROPERTY_OVERRIDES += vendor.debug.ssrdump.type=sscoredump

# Modem
PRODUCT_PACKAGES += dump_modem

# Thermal
PRODUCT_PACKAGES += android.hardware.thermal-service.pixel

# Thermal utils
PRODUCT_PACKAGES += thermal_symlinks

# Ensure enough free space to create zram backing device
PRODUCT_PRODUCT_PROPERTIES += \
    ro.zram_backing_device_min_free_mb=1536

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey

# misc_writer
PRODUCT_PACKAGES += \
    misc_writer

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot-service.default-pixel \
    android.hardware.boot-service.default_recovery-pixel

PRODUCT_SOONG_NAMESPACES += device/google/gs-common/bootctrl/aidl

TARGET_BOARD_PLATFORM := zumapro

AB_OTA_POSTINSTALL_CONFIG += \
	RUN_POSTINSTALL_system=true \
	POSTINSTALL_PATH_system=system/bin/otapreopt_script \
	FILESYSTEM_TYPE_system=ext4 \
POSTINSTALL_OPTIONAL_system=true

PRODUCT_SOONG_NAMESPACES += \
	hardware/google/av \
	hardware/google/interfaces \
	hardware/google/pixel \
	device/google/zumapro

# Set the environment variable to switch the Keymint HAL service to Rust
TRUSTY_KEYMINT_IMPL := rust

# OEM Unlock reporting
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.oem_unlock_supported=1

# From system.property
PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.default_network=27 \
	persist.vendor.ril.db_ecc.use.iccid_to_plmn=1 \
	persist.vendor.ril.db_ecc.id.type=5

# SIT-RIL Logging setting
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.ril.log_mask=3 \
	persist.vendor.ril.log.base_dir=/data/vendor/radio/sit-ril \
	persist.vendor.ril.log.chunk_size=5242880 \
	persist.vendor.ril.log.num_file=3

# Enable reboot free DSDS
PRODUCT_PRODUCT_PROPERTIES += \
	persist.radio.reboot_on_modem_change=false

# Configure DSDS by default
PRODUCT_PRODUCT_PROPERTIES += \
	persist.radio.multisim.config=dsds

# Enable Early Camping
PRODUCT_PRODUCT_PROPERTIES += \
	persist.vendor.ril.camp_on_earlier=1

# Enable SET_SCREEN_STATE request
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.ril.enable_set_screen_state=1

# Set the Bluetooth Class of Device
# Service Field: 0x5A -> 90
#    Bit 14: LE audio
#    Bit 17: Networking
#    Bit 19: Capturing
#    Bit 20: Object Transfer
#    Bit 22: Telephony
# MAJOR_CLASS: 0x42 -> 66 (Phone)
# MINOR_CLASS: 0x0C -> 12 (Smart Phone)
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.device.class_of_device?=90,66,12

# Set supported Bluetooth profiles to enabled
PRODUCT_PRODUCT_PROPERTIES += \
	bluetooth.profile.asha.central.enabled?=true \
	bluetooth.profile.a2dp.source.enabled?=true \
	bluetooth.profile.avrcp.target.enabled?=true \
	bluetooth.profile.bap.unicast.client.enabled?=true \
	bluetooth.profile.bas.client.enabled?=true \
	bluetooth.profile.csip.set_coordinator.enabled?=true \
	bluetooth.profile.gatt.enabled?=true \
	bluetooth.profile.hap.client.enabled?=true \
	bluetooth.profile.hfp.ag.enabled?=true \
	bluetooth.profile.hid.device.enabled?=true \
	bluetooth.profile.hid.host.enabled?=true \
	bluetooth.profile.map.server.enabled?=true \
	bluetooth.profile.mcp.server.enabled?=true \
	bluetooth.profile.opp.enabled?=true \
	bluetooth.profile.pan.nap.enabled?=true \
	bluetooth.profile.pan.panu.enabled?=true \
	bluetooth.profile.pbap.server.enabled?=true \
	bluetooth.profile.sap.server.enabled?=true \
	bluetooth.profile.ccp.server.enabled?=true \
	bluetooth.profile.vcp.controller.enabled?=true

# Override default HCI command timeout value for BT stack
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.hci.timeout_milliseconds=5000

# Carrier configuration default location
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.radio.config.carrier_config_dir=/vendor/firmware/carrierconfig

PRODUCT_PROPERTY_OVERRIDES += \
	telephony.active_modems.max_count=2

PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.usb.displayport.enabled=1

# Enable Settings 2-pane optimization for devices supporting display ports.
PRODUCT_SYSTEM_PROPERTIES += \
        persist.settings.large_screen_opt_for_dp.enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.hdcp_checking=drm-only

# Vendor modem extensive logging default property
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.modem.extensive_logging_enabled=false

# HWUI
TARGET_USES_VULKAN = true

# GPU
PRODUCT_PACKAGES += gpu_probe

# Install the OpenCL ICD Loader
PRODUCT_SOONG_NAMESPACES += external/OpenCL-ICD-Loader
PRODUCT_PACKAGES += \
	libOpenCL

PRODUCT_VENDOR_PROPERTIES += \
	ro.hardware.egl=mali \
	ro.hardware.vulkan=mali

# b/293371537 Opt in to RE-Graphite's aconfig-based preview rollout
PRODUCT_VENDOR_PROPERTIES += debug.renderengine.graphite_preview_optin=true

# b/295257834 Add HDR shaders to SurfaceFlinger's pre-warming cache
PRODUCT_VENDOR_PROPERTIES += ro.surface_flinger.prime_shader_cache.ultrahdr=1

# Mali Configuration Properties
PRODUCT_VENDOR_PROPERTIES += \
	vendor.mali.platform.config=/vendor/etc/mali/platform.config \
	vendor.mali.debug.config=/vendor/etc/mali/debug.config \
	vendor.mali.base_protected_max_core_count=4 \
	vendor.mali.base_protected_tls_max=67108864 \
	vendor.mali.platform_agt_frequency_khz=24576

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
	frameworks/native/data/etc/android.hardware.vulkan.version-1_4.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
	frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
	frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
	frameworks/native/data/etc/android.software.vulkan.deqp.level-2025-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
	frameworks/native/data/etc/android.software.opengles.deqp.level-2025-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml

# Configure EGL blobcache
PRODUCT_VENDOR_PROPERTIES += \
	ro.egl.blobcache.multifile=true \
	ro.egl.blobcache.multifile_limit=33554432 \

PRODUCT_VENDOR_PROPERTIES += \
	ro.opengles.version=196610 \
	graphics.gpu.profiler.support=true \

PRODUCT_SHIPPING_API_LEVEL := $(SHIPPING_API_LEVEL)

# VINTF
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    device/google/zumapro/vintf/vendor_framework_compatibility_matrix.xml
ifeq ($(PRODUCT_SHIPPING_API_LEVEL),35)
DEVICE_MANIFEST_FILE += \
    device/google/zumapro/vintf/manifest_202404.xml
DEVICE_MATRIX_FILE += \
    device/google/zumapro/vintf/compatibility_matrix_202404.xml
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE += \
    device/google/zumapro/vintf/device_framework_matrix_product_202404.xml
else
DEVICE_MANIFEST_FILE += \
    device/google/zumapro/vintf/manifest.xml
DEVICE_MATRIX_FILE += \
    device/google/zumapro/vintf/compatibility_matrix.xml
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE += \
    device/google/zumapro/vintf/device_framework_matrix_product.xml
endif

DEVICE_PACKAGE_OVERLAYS += device/google/zumapro/overlay
DEVICE_PACKAGE_OVERLAYS += device/google/zumapro/overlay-lineage

# Enforce the Product interface
PRODUCT_PRODUCT_VNDK_VERSION := current
PRODUCT_ENFORCE_PRODUCT_PARTITION_INTERFACE := true

# Init files
ifeq (true,$(filter $(TARGET_BOOTS_16K) $(PRODUCT_16K_DEVELOPER_OPTION),true))
PRODUCT_COPY_FILES += \
	device/google/zumapro/conf/init.efs.16k.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.efs.rc \
	device/google/zumapro/conf/fstab.efs.from_data:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.efs.from_data

PRODUCT_PACKAGES += fsck.f2fs.vendor
else
PRODUCT_COPY_FILES += \
	device/google/zumapro/conf/init.efs.4k.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.efs.rc
endif

# Recovery files
PRODUCT_COPY_FILES += \
	device/google/zumapro/conf/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.zumapro.rc

# Fstab files
ifeq (true,$(TARGET_BOOTS_16K))
PRODUCT_SOONG_NAMESPACES += \
        device/google/zumapro/conf/fs-16kb
else
PRODUCT_SOONG_NAMESPACES += \
        device/google/zumapro/conf/f2fs
endif

PRODUCT_PACKAGES += \
	fstab.zumapro \
	fstab.zumapro.vendor_ramdisk \
	fstab.zumapro-fips \
	fstab.zumapro-fips.vendor_ramdisk

# Insmod config files
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,init.insmod.*.cfg,$(TARGET_KERNEL_DIR),$(TARGET_COPY_OUT_VENDOR_DLKM)/etc)

# For creating dtbo image
PRODUCT_HOST_PACKAGES += \
	mkdtimg

# CHRE
## hal
PRODUCT_PACKAGES += android.hardware.contexthub-service.generic
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.context_hub.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.context_hub.xml

# Userdata Checkpointing OTA GC
PRODUCT_PACKAGES += \
	checkpoint_gc

# Vendor verbose logging default property
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.verbose_logging_enabled=false

# CP Logging properties
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.sys.modem.logging.loc = /data/vendor/slog \
	persist.vendor.sys.silentlog.tcp = "On" \
	ro.vendor.cbd.modem_removable = "1" \
	ro.vendor.cbd.modem_type = "s5100sit" \
	persist.vendor.sys.modem.logging.br_num=5 \
	persist.vendor.sys.modem.logging.enable=true

# Enable silent CP crash handling
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.ril.crash_handling_mode=2

# Add support dual SIM mode
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.radio.multisim_switch_support=true

# Touch
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# Sensors
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.dynamic.head_tracker.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.dynamic.head_tracker.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml\
	frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml

# Add sensor HAL AIDL product packages
PRODUCT_PACKAGES += android.hardware.sensors-service.multihal

# USB HAL
PRODUCT_PACKAGES += \
	android.hardware.usb-service
PRODUCT_PACKAGES += \
	android.hardware.usb.gadget-service

# MIDI feature
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

# adpf 16ms update rate
PRODUCT_PRODUCT_PROPERTIES += \
        vendor.powerhal.adpf.rate=16666666

-include hardware/google/pixel/power-libperfmgr/aidl/device.mk

# IRQ rebalancing.
include hardware/google/pixel/rebalance_interrupts/rebalance_interrupts.mk

# PowerStats HAL
PRODUCT_PACKAGES += \
	android.hardware.power.stats-service.pixel

#
# Audio HALs
#

# Enable AAudio MMAP/NOIRQ data path.
PRODUCT_PROPERTY_OVERRIDES += aaudio.mmap_policy=2
PRODUCT_PROPERTY_OVERRIDES += aaudio.mmap_exclusive_policy=2
PRODUCT_PROPERTY_OVERRIDES += aaudio.hw_burst_min_usec=2000

# Set util_clamp_min for s/w spatializer
PRODUCT_PROPERTY_OVERRIDES += audio.spatializer.effect.util_clamp_min=300

# Camera
PRODUCT_SOONG_NAMESPACES += \
    hardware/google/camera

# Connectivity
PRODUCT_PACKAGES += \
        ConnectivityOverlay

# Storage health HAL
PRODUCT_PACKAGES += \
	android.hardware.health.storage-service.default

# Battery Mitigation
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.battery_mitigation.aidl.enable=true

# storage pixelstats
-include hardware/google/pixel/pixelstats/device.mk

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Enforce generic ramdisk allow list
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# WiFi
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
	frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
	frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml

# Bluetooth channel sounding
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.bluetooth_le.channel_sounding.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.channel_sounding.xml

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.concurrent.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.concurrent.xml \
	frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml\
	frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml\

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \

PRODUCT_PROPERTY_OVERRIDES += \
	debug.slsi_platform=1 \
	debug.hwc.winupdate=1

PRODUCT_PROPERTY_OVERRIDES += \
	debug.sf.disable_backpressure=0 \
	debug.sf.enable_gl_backpressure=1 \
	debug.sf.enable_sdr_dimming=1 \
        debug.sf.dim_in_gamma_in_enhanced_screenshots=1

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.use_phase_offsets_as_durations=1
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.late.sf.duration=10500000
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.late.app.duration=16600000
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.early.sf.duration=16600000
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.early.app.duration=16600000
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.earlyGl.sf.duration=16600000
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.earlyGl.app.duration=16600000
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.frame_rate_multiple_threshold=120
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.treat_170m_as_sRGB=1
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.hdcp_negotiation=1
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.hdcp_support=1

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.enable_layer_caching=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.set_idle_timer_ms?=80
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.set_touch_timer_ms=200
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.set_display_power_timer_ms=1000
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.use_content_detection_for_refresh_rate=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.max_frame_buffer_acquired_buffers=3

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.supports_background_blur=1
PRODUCT_SYSTEM_PROPERTIES += ro.launcher.blur.appLaunch=0

# Must align with HAL types Dataspace
# The data space of wide color gamut composition preference is Dataspace::DISPLAY_P3
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.wcg_composition_dataspace=143261696

# Display
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.has_wide_color_display=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.has_HDR_display=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.use_color_management=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.protected_contents=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.display_update_imminent_timeout_ms=50
# Disable dimming by default
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.display.0.brightness.dimming.usage?=2
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.display.1.brightness.dimming.usage?=2

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.sf.native_mode=2

# limit DPP downscale ratio
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.hwc.dpp.downscale=4

# Cannot reference variables defined in BoardConfig.mk, uncomment this if
# BOARD_USES_EXYNOS_AFBC_FEATURE is true
# set the dss enable status setup
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.ddk.set.afbc=1

PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_PACKAGES += hostapd
PRODUCT_PACKAGES += wpa_supplicant
PRODUCT_PACKAGES += wpa_supplicant.conf

WIFI_PRIV_CMD_UPDATE_MBO_CELL_STATUS := enabled

# Video
PRODUCT_PROPERTY_OVERRIDES += \
       debug.c2.use_dmabufheaps=1 \
       media.c2.dmabuf.padding=512 \
       debug.stagefright.ccodec_delayed_params=1 \
       ro.vendor.gpu.dataspace=1

PRODUCT_PROPERTY_OVERRIDES += \
        debug.stagefright.c2-poolmask=1507328

# Create input surface on the framework side
PRODUCT_PROPERTY_OVERRIDES += \
	debug.stagefright.c2inputsurface=-1 \

PRODUCT_PROPERTY_OVERRIDES += media.c2.hal.selection=aidl

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

PRODUCT_TAGS += dalvik.gc.type-precise

# Trusty (KM, GK, Storage)
$(call inherit-product, system/core/trusty/trusty-storage.mk)
$(call inherit-product, system/core/trusty/trusty-base.mk)

# Storage: for factory reset protection feature
PRODUCT_PROPERTY_OVERRIDES += \
	ro.frp.pst=/dev/block/by-name/frp

# System props to enable Bluetooth Quality Report (BQR) feature
PRODUCT_PRODUCT_PROPERTIES += \
	persist.bluetooth.bqr.event_mask?=30 \
	persist.bluetooth.bqr.min_interval_ms=500

PRODUCT_ENFORCE_RRO_TARGETS := \
	framework-res

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Use FUSE passthrough
PRODUCT_PRODUCT_PROPERTIES += \
	persist.sys.fuse.passthrough.enable=true

# Use /product/etc/fstab.postinstall to mount system_other
PRODUCT_PRODUCT_PROPERTIES += \
	ro.postinstall.fstab.prefix=/product

PRODUCT_COPY_FILES += \
	device/google/zumapro/conf/fstab.ro.postinstall:$(TARGET_COPY_OUT_PRODUCT)/etc/fstab.postinstall

# fastbootd
PRODUCT_PACKAGES += \
	android.hardware.fastboot@1.1-impl.pixel \
	fastbootd

#google iwlan
PRODUCT_PACKAGES += \
	Iwlan

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

PRODUCT_COPY_FILES += \
	device/google/zumapro/default-permissions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/default-permissions.xml \
	device/google/zumapro/component-overrides.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sysconfig/component-overrides.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \

PRODUCT_PACKAGES += \
	android.hardware.health-service.zumapro \
	android.hardware.health-service.zumapro_recovery \

# Audio
PRODUCT_PACKAGES += \
    libvisualizeraidl \
    libbundleaidl \
    libreverbaidl \
    libdynamicsprocessingaidl \
    libloudnessenhanceraidl \
    libdownmixaidl \
    libhapticgeneratoraidl

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio_hal.aidl.enable=true
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.audio.ihaladaptervendorextension_enabled=true

## Audio properties
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.audio.cca.unsupported=false

PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.vc_call_vol_steps=7 \
	ro.audio.monitorRotation = true \
	ro.audio.offload_wakelock=false

PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.media_vol_steps=25

# vndservicemanager and vndservice no longer included in API 30+, however needed by vendor code.
# See b/148807371 for reference
PRODUCT_PACKAGES += vndservicemanager
PRODUCT_PACKAGES += vndservice

## Start packet router
PRODUCT_PROPERTY_OVERRIDES += vendor.pktrouter=1

# Thermal HAL
PRODUCT_PROPERTY_OVERRIDES += persist.vendor.enable.thermal.genl=true

# EdgeTPU
# Tflite Darwinn delegate property
PRODUCT_VENDOR_PROPERTIES += vendor.edgetpu.tflite_delegate.force_disable_io_coherency=0

# Edgetpu CPU scheduler property
PRODUCT_VENDOR_PROPERTIES += vendor.edgetpu.cpu_scheduler.policy=FIFO
PRODUCT_VENDOR_PROPERTIES += vendor.edgetpu.cpu_scheduler.priority=99

# A/B support
PRODUCT_PACKAGES += \
	otapreopt_script \
	cppreopts.sh \
	update_engine \
	update_engine_sideload \
	update_verifier

# pKVM
$(call inherit-product, packages/modules/Virtualization/apex/product_packages.mk)
PRODUCT_BUILD_PVMFW_IMAGE := true
# Set the environment variable to enable the Secretkeeper HAL service.
SECRETKEEPER_ENABLED := true

# Enable to build standalone vendor_kernel_boot image.
PRODUCT_BUILD_VENDOR_KERNEL_BOOT_IMAGE := true

# Enable watchdog timeout loop breaker.
PRODUCT_PROPERTY_OVERRIDES += \
	framework_watchdog.fatal_window.second=600 \
	framework_watchdog.fatal_count=3

# Enable zygote critical window.
PRODUCT_PROPERTY_OVERRIDES += \
	zygote.critical_window.minute=10

# Suspend properties
PRODUCT_PROPERTY_OVERRIDES += \
    suspend.short_suspend_threshold_millis=5000

# Enable Incremental on the device
PRODUCT_PROPERTY_OVERRIDES += \
	ro.incremental.enable=true

# Project
include hardware/google/pixel/common/pixel-common-device.mk

# Wifi ext
include hardware/google/pixel/wifi_ext/device.mk

# Keymint configuration
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml \
    frameworks/native/data/etc/android.hardware.device_unique_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.device_unique_attestation.xml

# Call deleteAllKeys if vold detects a factory reset
PRODUCT_VENDOR_PROPERTIES += ro.crypto.metadata_init_delete_all_keys.enabled?=true

# Use HCTR2 for filenames encryption on adoptable storage.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.volume.options=aes-256-xts:aes-256-hctr2

# Hardware Info Collection
include hardware/google/pixel/HardwareInfo/HardwareInfo.mk

PRODUCT_CHECK_VENDOR_SEAPP_VIOLATIONS := true

PRODUCT_CHECK_DEV_TYPE_VIOLATIONS := true

# Enable Android Messages satellite conversation feature.
# TODO(b/322518837): Remove the property override once the flag is launched.
PRODUCT_PROPERTY_OVERRIDES += \
    debug.bugle.enable_emergency_satellite_messaging=true

# Allow longer timeout for incident report generation in bugreport
# Overriding in /product partition instead of /vendor intentionally,
# since it can't be overridden from /vendor.
PRODUCT_PRODUCT_PROPERTIES += \
	dumpstate.strict_run=false

PRODUCT_NO_BIONIC_PAGE_SIZE_MACRO := true
PRODUCT_CHECK_PREBUILT_MAX_PAGE_SIZE := true

# AiAi Config
PRODUCT_COPY_FILES += \
    device/google/zumapro/allowlist_com.google.android.as.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/allowlist_com.google.android.as.xml

# Camera
PRODUCT_PRODUCT_PROPERTIES += \
    ro.vendor.camera.extensions.package=com.google.android.apps.camera.services \
    ro.vendor.camera.extensions.service=com.google.android.apps.camera.services.extensions.service.PixelExtensions

# Google Assistant
PRODUCT_PRODUCT_PROPERTIES += ro.opa.eligible_device=true

# Lineage Health
include hardware/google/pixel/lineage_health/device.mk

$(call soong_config_set_bool,lineage_health,charging_control_supports_deadline,true)
$(call soong_config_set_bool,lineage_health,charging_control_supports_limit,true)
$(call soong_config_set_bool,lineage_health,charging_control_supports_toggle,false)

# Linker config
PRODUCT_VENDOR_LINKER_CONFIG_FRAGMENTS += \
    device/google/zumapro/linker.config.json

# Parts
PRODUCT_PACKAGES += \
    GoogleParts

# Properties
TARGET_PRODUCT_PROP += device/google/zumapro/product.prop
TARGET_SYSTEM_PROP += device/google/zumapro/system.prop

# Tethering
PRODUCT_PACKAGES += \
    TetheringOverlay

# Touch
include hardware/google/pixel/touch/device.mk
