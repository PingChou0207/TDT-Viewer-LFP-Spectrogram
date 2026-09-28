#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")"
PYTHON_BIN="${PYTHON_BIN:-/opt/anaconda3/bin/python}"
if [[ ! -x "$PYTHON_BIN" ]]; then
    PYTHON_BIN="$(command -v python3 || true)"
fi
if [[ -z "$PYTHON_BIN" || ! -x "$PYTHON_BIN" ]]; then
    echo "ERROR: Python 3 was not found."
    exit 1
fi

export PYQTGRAPH_QT_LIB=PySide6
export PYINSTALLER_CONFIG_DIR="$PWD/.pyinstaller-cache"

"$PYTHON_BIN" -m PyInstaller --noconfirm --clean TDT_Viewer_LFP_Spectrogram_v3.spec

APP_PATH="$PWD/dist/TDT Viewer LFP Spectrogram v3.app"
ZIP_PATH="$PWD/dist/TDT_Viewer_LFP_Spectrogram_v3_macOS_arm64.zip"
if [[ ! -d "$APP_PATH" ]]; then
    echo "ERROR: Expected app was not created: $APP_PATH"
    exit 1
fi

codesign --force --deep --sign - "$APP_PATH"
rm -f "$ZIP_PATH"
ditto -c -k --sequesterRsrc --keepParent "$APP_PATH" "$ZIP_PATH"

echo "App: $APP_PATH"
echo "ZIP: $ZIP_PATH"
