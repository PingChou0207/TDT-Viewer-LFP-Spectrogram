# TDT Viewer LFP Spectrogram v4

A read-only desktop viewer for TDT blocks with synchronized epoch events, multi-channel LFP traces, LFP spectrograms, and MU traces.

## Features

- Synchronized Epoch, LFP, Spectrogram, and MU panels, with an optional Camera dock
- Multi-channel spectrogram display with per-channel frequency ticks and color bar
- Real power (`dB re 1 µV²/Hz`) and percentage-power modes
- Configurable frequency range, 0.5 Hz default frequency resolution, and 0.5 s default maximum time step
- Optional constant/linear detrending and NeuroExplorer-compatible Gaussian frequency smoothing
- Automatic anti-alias downsampling for high-sampling-rate LFP data
- `viridis` and `jet` color maps
- Adjustable panel heights, cursors, event navigation, gain normalization, and scale bars
- PNG/JPEG and publication-resolution PNG export
- Portable `.tdtv` sessions containing cached data and display state

When a block contains both a `Cam#` epoc and matching `Cam#.avi` or `Cam#.mp4`, the **Camera** button opens a synchronized video preview. Use **Play/Pause** or **Frame** buttons to inspect frames. Synchronization follows the recorded epoc frame timestamps, not nominal video FPS. Video files are not embedded in `.tdtv` sessions; keep the original block available to reopen camera video.

The viewer does not modify the selected TDT block.

## Run from source

Python 3.12 is recommended.

```bash
python -m venv .venv
source .venv/bin/activate        # Windows: .venv\Scripts\activate
python -m pip install -r requirements-build.txt
python src/tdt_viewer_lfp_spectrogram_v4.py
```

## Build desktop applications

### macOS

Run:

```bash
./build_macos.command
```

The app and ZIP archive are written to `dist/`. The build is ad-hoc signed, not Apple-notarized. On first launch, macOS may require Control-clicking the app and selecting **Open**.

### Windows x64

On a Windows 10/11 x64 computer with Python 3.12, double-click `build_windows.bat`. The portable application folder and ZIP archive are written to `dist/`; keep the EXE beside its `_internal` folder.

### GitHub Actions

Run the **Build desktop apps** workflow manually, or push a tag beginning with `v`, to build macOS and Windows artifacts in GitHub Actions.

## Documentation

- [繁體中文完整使用手冊](USER_MANUAL_zh-TW.md)
- [Complete English User Manual](USER_MANUAL_en.md)
- [Build notes](README_BUILD.txt)

Important: `.tdtv` uses Python pickle and should only be opened from trusted sources.

## Credits

- Application design and development: **PingChou**
- TDT data access: TDT Python SDK
- Numerical and signal processing: Python, NumPy, SciPy
- Desktop UI and plotting: PySide6, pyqtgraph
- Camera decoding: OpenCV
- Application packaging: PyInstaller

TDT and NeuroExplorer are trademarks or product names of their respective owners. This independent application does not imply endorsement by either company.

## License

No open-source license has been granted yet. The source is publicly visible for inspection and collaboration; copyright remains with the author unless a license is added later.
