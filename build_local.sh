#!/usr/bin/env bash
cd zmk/
# uv run west build -s app -d "build/corne_left" -b "nice_nano_v2"  -- -DZMK_CONFIG="$HOME/repos/zmk-config/config" -DSHIELD="corne_left" -DZMK_EXTRA_MODULES="$HOME/repos/zmk-config/modules/zmk-helpers"
# uv run west build -s app -d "build/corne_right" -b "nice_nano_v2"  -- -DZMK_CONFIG="$HOME/repos/zmk-config/config" -DSHIELD="corne_right" -DZMK_EXTRA_MODULES="$HOME/repos/zmk-config/modules/zmk-helpers"

uv run west build -s app -d "build/cradio_left" -b "nice_nano"  -- -DZMK_CONFIG="$HOME/repos/zmk-config/config" -DSHIELD="cradio_left" -DZMK_EXTRA_MODULES="$HOME/repos/zmk-config/modules/zmk-helpers;$HOME/repos/zmk-config/modules/zmk-component-raytac-dongle" -DCONFIG_ZMK_SPLIT=y -DCONFIG_ZMK_SPLIT_ROLE_CENTRAL=n
uv run west build -s app -d "build/cradio_right" -b "nice_nano"  -- -DZMK_CONFIG="$HOME/repos/zmk-config/config" -DSHIELD="cradio_right" -DZMK_EXTRA_MODULES="$HOME/repos/zmk-config/modules/zmk-helpers;$HOME/repos/zmk-config/modules/zmk-component-raytac-dongle" -DCONFIG_ZMK_SPLIT=y -DCONFIG_ZMK_SPLIT_ROLE_CENTRAL=n

uv run west build -s app -d "build/cradio_dongle" -b "mdbt50q_rx"  -- -DZMK_CONFIG="$HOME/repos/zmk-config/config" -DSHIELD="cradio_dongle" -DZMK_EXTRA_MODULES="$HOME/repos/zmk-config/modules/zmk-helpers;$HOME/repos/zmk-config/modules/zmk-component-raytac-dongle"

uv run west build -s app -d "build/settings_reset_dongle" -b "mdbt50q_rx"  -- -DZMK_CONFIG="$HOME/repos/zmk-config/config" -DSHIELD="settings_reset" -DZMK_EXTRA_MODULES="$HOME/repos/zmk-config/modules/zmk-helpers;$HOME/repos/zmk-config/modules/zmk-component-raytac-dongle"
uv run west build -s app -d "build/settings_reset" -b "nice_nano"  -- -DZMK_CONFIG="$HOME/repos/zmk-config/config" -DSHIELD="settings_reset" -DZMK_EXTRA_MODULES="$HOME/repos/zmk-config/modules/zmk-helpers;$HOME/repos/zmk-config/modules/zmk-component-raytac-dongle"

cd ..
rm -rf firmware
mkdir firmware
# cp zmk/build/corne_left/zephyr/zmk.uf2 firmware/corne_left.uf2
# cp zmk/build/corne_right/zephyr/zmk.uf2 firmware/corne_right.uf2
cp zmk/build/cradio_left/zephyr/zmk.uf2 firmware/cradio_left.uf2
cp zmk/build/cradio_right/zephyr/zmk.uf2 firmware/cradio_right.uf2
cp zmk/build/cradio_dongle/zephyr/zmk.uf2 firmware/cradio_dongle.uf2
cp zmk/build/settings_reset_dongle/zephyr/zmk.uf2 firmware/settings_reset_dongle.uf2
cp zmk/build/settings_reset/zephyr/zmk.uf2 firmware/settings_reset.uf2
