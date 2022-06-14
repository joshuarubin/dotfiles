#!/usr/bin/env bash

set -eu
set -o pipefail

MOTU_IN_1='alsa_input.usb-MOTU_M4_M40000033738-00.pro-input-0:capture_AUX0'
MOTU_IN_2='alsa_input.usb-MOTU_M4_M40000033738-00.pro-input-0:capture_AUX1'
MOTU_IN_3='alsa_input.usb-MOTU_M4_M40000033738-00.pro-input-0:capture_AUX2'
MOTU_IN_4='alsa_input.usb-MOTU_M4_M40000033738-00.pro-input-0:capture_AUX3'

MOTU_OUT_1='alsa_output.usb-MOTU_M4_M40000033738-00.pro-output-0:playback_AUX0'
MOTU_OUT_2='alsa_output.usb-MOTU_M4_M40000033738-00.pro-output-0:playback_AUX1'
MOTU_OUT_3='alsa_output.usb-MOTU_M4_M40000033738-00.pro-output-0:playback_AUX2'
MOTU_OUT_4='alsa_output.usb-MOTU_M4_M40000033738-00.pro-output-0:playback_AUX3'

IC_7300_IN_1='alsa_input.usb-Burr-Brown_from_TI_USB_Audio_CODEC-00.pro-input-0:capture_AUX0'
IC_7300_IN_2='alsa_input.usb-Burr-Brown_from_TI_USB_Audio_CODEC-00.pro-input-0:capture_AUX1'

TS_590_IN_1='alsa_input.usb-Burr-Brown_from_TI_USB_Audio_CODEC-00.2.pro-input-0:capture_AUX0'
TS_590_IN_2='alsa_input.usb-Burr-Brown_from_TI_USB_Audio_CODEC-00.2.pro-input-0:capture_AUX1'

# mic input for pulse
pw-link "${MOTU_IN_1}" 'Heil PR 40:input_1' || true

# tm-d710g input for jack_mixer
pw-link "${MOTU_IN_4}" 'jack_mixer:TM-D710G' || true

# jack_mixer to motu 1-2
pw-link 'jack_mixer:Main L' "${MOTU_OUT_1}" || true
pw-link 'jack_mixer:Main R' "${MOTU_OUT_2}" || true

# keyjack to motu 1-2
pw-link 'keyjack:out' "${MOTU_OUT_1}" || true
pw-link 'keyjack:out' "${MOTU_OUT_2}" || true

# keyjack to zoom
pw-link 'keyjack:out' 'ZOOM VoiceEngine:input_1' || true

pw-link "${IC_7300_IN_1}" 'jack_mixer:IC-7300 RX' || true
pw-link "${IC_7300_IN_2}" 'jack_mixer:IC-7300 RX' || true

pw-link "${TS_590_IN_1}" 'jack_mixer:TS-590 RX' || true
pw-link "${TS_590_IN_2}" 'jack_mixer:TS-590 RX' || true
