#!/bin/sh -e

XDG_DATA_HOME=${XDG_DATA_HOME:-~/.local/share}
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

CHEZMOI_DATA_DIR=${CHEZMOI_DATA_DIR:-${XDG_DATA_HOME}/chezmoi}
CHEZMOI_CONFIG_DIR=${CHEZMOI_CONFIG_DIR:-${XDG_CONFIG_HOME}/chezmoi}

CHEZMOI_CONFIG_FILE=${CHEZMOI_CONFIG_FILE:-${CHEZMOI_CONFIG_DIR}/chezmoi.yaml}

chmod 700 "${CHEZMOI_DATA_DIR}"

cd "${CHEZMOI_DATA_DIR}"

mkdir -p "${CHEZMOI_CONFIG_DIR}"
chmod 700 "${CHEZMOI_CONFIG_DIR}"

if [ ! -s "${CHEZMOI_CONFIG_FILE}" ]; then
  cp ./scripts/chezmoi.yaml "${CHEZMOI_CONFIG_FILE}"
fi

chmod 600 "${CHEZMOI_CONFIG_FILE}"

tic -x -o ~/.terminfo terminfo
chezmoi apply

(>&2 echo)
(>&2 echo "Don't forget to update ${CHEZMOI_CONFIG_FILE} and run \`chezmoi apply\` again")
