# TDT Viewer LFP Spectrogram v4 - Complete User Manual

Version 4.0 | Updated: 2026-10-06

## 1. Purpose

TDT Viewer LFP Spectrogram v4 is a read-only desktop analysis and visualization tool. It loads a TDT block and synchronizes Epoch events, multi-channel LFP traces, multi-channel LFP spectrograms, and multi-channel MU traces on one time axis.

The application does not modify the original TDT block. Display preferences can be retained automatically, while a `.tdtv` session can store cached data and the complete working state.

## 2. Installation and Launch

### macOS

- The supplied build is for Apple Silicon arm64.
- Extract the ZIP and move `TDT Viewer LFP Spectrogram v4.app` to Applications.
- On first launch, Control-click or right-click the App and select Open.
- The build is ad-hoc signed and is not Apple-notarized.

### Windows

- Windows 10/11 x64 is supported.
- Extract the complete ZIP before opening `TDT Viewer LFP Spectrogram v4.exe`.
- Keep the EXE and `_internal` folder together.

## 3. Quick Start

1. Click **Open Block** and select a complete TDT block folder.
2. Confirm `LFP_` and `MUs_` under **Streams**.
3. Select channels under **LFP ch**, **MU ch**, and **Spectrogram ch**.
4. Select events under **Epochs**.
5. Navigate with the bottom slider, time field, or `1/4W` buttons.
6. Set the correct gain, then adjust amplitudes, spacing, scale bars, and spectrogram parameters.
7. Right-click the plot area to control the grid, line width, and image export.

LFP traces and spectrograms use the stream named `LFP_`; MU traces use `MUs_`. Other store names are listed under Streams but are not mapped automatically to these panels.

## 4. Main Window

The right side contains synchronized Epoch, LFP, Spectrogram, and MU panels from top to bottom. Drag the horizontal splitters to resize panels.

| Area | Function |
|---|---|
| Settings panel | Block, stream, channel, epoch, cursor, trace, and spectrogram controls. |
| Plot area | Synchronized Epoch, LFP, Spectrogram, and MU displays. |
| Navigation bar | Show/hide settings, move through time, or enter the start time. |
| Status bar | Block path, gain, load, copy, and export messages. |

### Synchronized Camera Video

If the TDT block contains a `Cam1` (or other `Cam#`) epoc and a matching `Cam1.avi` or `Cam1.mp4`, the **Camera** button becomes available. It opens a dock beside the plots; drag the dock boundary to resize it. Select another camera at the top of the dock when multiple cameras are present.

- The time slider and time field show the most recent recorded frame at that TDT time. Before the first camera timestamp, the preview stays blank.
- Double-click a plot to preview the frame at that time. **◀ Frame** and **Frame ▶** step through frames and update the plot cursor. **Play/Pause** advances on the TDT timeline; the plots move when playback leaves the visible window.
- Synchronization uses `Cam#` epoc onsets and frame numbers, not the AVI's nominal FPS. Extra video frames at the end without timestamps are not treated as synchronized data.
- `.tdtv` stores camera timestamps and the original block path, **not the large video file**. The AVI/MP4 must still be accessible when reopening a session.

## 5. Top Buttons and Data Management

| Button | Function |
|---|---|
| Open Block | Reads a TDT block. Current time and cursor return to 0 s. |
| Open Session | Restores cached data and UI state from a `.tdtv` file. |
| Save Session | Stores stream data, epoch onsets, channels, and display settings. |
| New Viewer | Opens another block in an independent viewer window. |
| Credits | Displays version, developer credit, and third-party components. |

The **Block** section shows the current path. **Streams** controls which stores are active. Clearing `LFP_` hides both the LFP trace and spectrogram; clearing `MUs_` hides the MU trace.

## 6. Channel Selection

- **LFP ch**, **MU ch**, and **Spectrogram ch** independently control their panels.
- The first eight trace channels are selected by default.
- Initial spectrogram channels follow the default LFP selection.
- Double-click a channel-section title and enter `1,2,5-8`, `all`, or `none` for batch selection.
- Channel entry is 1-based; plot labels are shown as `ch1`, `ch2`, and so on.

## 7. Epoch Display and Navigation

- Select one or more event names under **Epochs**.
- Onsets are drawn in the Epoch panel and overlaid as vertical lines on the spectrogram.
- `PC3_` is selected by default when available; otherwise, the first available epoch is selected.
- Under **Epoch jump**, choose an Epoch name and Tick index. Use `Prev`, `Jump`, or `Next` to navigate.
- The selected onset becomes the left edge of the current time window.

## 8. Cursor

- Double-click any plot to set the cursor time.
- **Show cursor on traces** displays a synchronized vertical cursor in all panels.
- **Jump to Cursor** makes the cursor time the current window start.
- **Copy Cursor Time** copies the time in seconds with six decimal places.

## 9. Time and Layout Controls

| Control | Function |
|---|---|
| Window length | Visible duration, 0.1-600 s; default 5 s. |
| Bottom slider | Continuously changes the window start time. |
| Time field | Direct start-time entry with 0.001 s display precision. |
| `← 1/4W`, `1/4W →` | Moves by one quarter of the current Window length. |
| Hide / Show | Collapses or restores the settings panel. |
| X-axis display | `Bottom only` or `All panels`. |

Free mouse zooming and panning are disabled so the four panels remain synchronized.

## 10. LFP and MU Trace Display

`display = raw / Signal gain × stream amplitude + channel offset`

| Setting | Function |
|---|---|
| LFP_ amplitude | Changes only the LFP trace display scale. |
| MUs_ amplitude | Changes only the MU trace display scale. |
| Signal gain | Divides LFP, MU, and spectrogram input before analysis/display. |
| Channel spacing | Controls the vertical separation of trace and epoch rows. |
| White/black | Checked: white background/black trace; unchecked: inverse theme. |
| Show scale bar | Shows or hides LFP/MU scale bars. |
| LFP_/MUs_ scale bar | Scale-bar label in µV; defaults are 500 and 100 µV. |

For display speed, an LFP trace is rendered with at most approximately 4,000 display points in the visible window. This does not modify the source data or spectrogram calculation. MU traces remain sample-by-sample.

## 11. Plot Context Menu and Image Export

| Option | Function |
|---|---|
| Show Grid | Toggles shared time and channel grids. |
| Line Width | Selects 0.5, 1, 1.5, 2, or 3 px. |
| Save image includes settings panel | Exports plots only or the full window with settings. |
| Export Plot as Image | Exports PNG or JPEG at the current display size. |
| Export Publication PNG | Re-renders at 1-6× scale; default 3× with 300 DPI metadata. |

## 12. Spectrogram Display Modes

- **Real power**: `dB re 1 µV²/Hz`. The signal after raw/gain normalization is assumed to be in volts.
- **Percentage power**: normalizes each channel and each time bin to 100% across the displayed frequency range.
- Mode changes reset Color min/max to `-20 to 40 dB` or `0 to 5%`.
- Multiple channels are stacked vertically. Each channel has its own frequency tick labels while all channels share one color bar.
- Color maps: `viridis` and `jet`.

## 13. Spectrogram Preprocessing and STFT

| Parameter | Function |
|---|---|
| Show | Shows or hides the spectrogram panel. |
| Detrend | `None`, `Constant`, or `Linear` before each STFT calculation. |
| Min/Max freq | Display range and Percentage power normalization range. |
| Freq resolution | Target frequency-bin spacing; default 0.5 Hz. |
| STFT window | Hann-window length; default 2 s. |
| Max time step | Maximum spacing between adjacent time bins; default 0.5 s. |
| Overlap | Requested overlap, 0-95%; default 75%. |

If the STFT window is shorter than `1 / Freq resolution`, the application lengthens the effective window automatically. Overlap may also increase automatically to satisfy Max time step. The interface and title report actual analysis fs, Δf, Δt, and window length.

## 14. Time-Frequency Resolution and Post-processing

| Frequency resolution | Minimum practical window | Suggested Max time step |
|---:|---:|---:|
| 0.5 Hz | 2 s | 0.25-0.5 s |
| 1 Hz | 1 s | 0.1-0.25 s |
| 2 Hz | 0.5 s | 0.05-0.1 s |

A smaller time step produces denser estimates but does not shorten the STFT window used by each estimate.

### Why is the spectrogram blank at the start? (Math and implementation)

Each PSD estimate uses a complete Hann window, and its timestamp marks the **center** of that window, not its left edge. Let `fs` be the analysis sampling rate, `N` the effective window length in samples, and `H` the hop size. Approximately,

`W = N / fs`, `Δt = H / fs`, and `t_k = t₀ + W/2 + kΔt`.

Here `t₀` is the start of the data segment used for analysis and `t_k` is the center of STFT time bin `k`. The application reads additional data around the visible range, so `t₀` can precede the left edge when viewing the middle of a recording. At the **beginning of the recording**, however, reading stops at the source `start_time`: no signal is zero-padded or invented before it. The first complete window therefore has its center approximately at `start_time + W/2`.

The relevant calculation is summarized below:

```python
W_requested = max(STFT_window, 1 / Freq_resolution)
N = min(max(8, round(STFT_window * fs), ceil(fs / Freq_resolution)), available_samples)
NFFT = max(N, round(fs / Freq_resolution))
H = N - noverlap  # overlap may increase to meet Max time step
freq, rel_time, psd = scipy.signal.spectrogram(
    samples, fs=fs, window="hann", nperseg=N, noverlap=noverlap,
    nfft=NFFT, scaling="density", mode="psd"
)
absolute_time = segment_start + rel_time
```

`W_requested` describes the setting rule; the actual `N` may be shorter if too few samples are available. `NFFT` sets the displayed frequency-grid spacing, `fs/NFFT`. Zero-padding makes that grid denser but **does not** improve the true frequency discrimination of a short recording.

For display, the first time-bin color cell extends about `Δt/2` to the left of its center. Thus color starts around `start_time + W/2 − Δt/2`. With the defaults (`Freq resolution = 0.5 Hz`, `STFT window = 2 s`, `Overlap = 75%`, `Max time step = 0.5 s`), `W ≈ 2 s` and `Δt ≈ 0.5 s`: the first PSD is centered at about `1.0 s`, while its color cell starts near `0.75 s`. The initial blank area reflects the complete-window and center-timestamp convention; it **does not mean the raw LFP is missing**. For short recordings or different sampling/overlap settings, refer to the actual `window` and `Δt` shown in the plot.

### NeuroExplorer-compatible Gaussian smoothing

- Filter width is the Gaussian full width at half maximum in frequency bins; default 3 bins.
- Smoothing is applied only along frequency, not time.
- Percentage power is renormalized to 100% after smoothing.

`f[i] = exp(-i² / sigma) / norm`, where `i = -2d ... 2d`, `d = (int(w)+1)//2`, and `sigma = -w² × 0.25/log(0.5)`.

## 15. Automatic Downsampling

- Native sampling is retained for LFP streams around 1-2 kHz.
- Above 2 kHz, the signal is anti-alias filtered and polyphase-resampled when appropriate.
- Analysis fs is at least approximately 1 kHz and maintains `Max freq <= 0.45 × analysis fs`.
- Extra data are read before and after the visible window to reduce STFT edge effects.

## 16. Sessions, Preferences, and Reset

- `.tdtv` stores stream arrays, sampling rates, start times, epochs, cursor, channels, time position, panel sizes, and display settings.
- Session files may be large because they contain cached data, but they can restore a view without the original block.
- `.tdtv` uses Python pickle; open only trusted session files.
- Closing a window saves local UI preferences. Reopening the App restores preferences but does not reload the original block data.
- **Reset** restores the main trace/display defaults but does not reload data, clear channel/epoch selections, or reset spectrogram parameters.

## 17. Troubleshooting

| Problem | Suggested action |
|---|---|
| LFP/MU missing | Confirm exact stream names `LFP_`/`MUs_`, non-empty data, and Stream selection. |
| Blank spectrogram | Check Show, `LFP_`, Spectrogram ch, frequency range, and Color min/max. |
| Epoch missing | Select it under Epochs and verify that the window includes an onset. |
| Traces too small/overlapping | Check Signal gain, then adjust amplitude and Channel spacing. |
| Slow updates | Reduce spectrogram channels, shorten Window length, increase time step, or reduce frequency range. |
| Large session | `.tdtv` contains all stream data; skip session saving if only an image is needed. |
| macOS will not open | Control-click > Open; for trusted files, remove quarantine if necessary. |
| Windows will not start | Fully extract the ZIP and keep EXE and `_internal` together. |

## 18. Windows Native Build

1. Install 64-bit Python 3.12 and select Add Python to PATH.
2. Copy the complete project folder to Windows.
3. Double-click `build_windows.bat`.
4. Use `dist/TDT_Viewer_LFP_Spectrogram_v4_Windows_x64.zip`.

The included `.github/workflows/build-apps.yml` can also build a Windows x64 artifact on GitHub Actions.

## 19. Credits

- Application design and development: **PingChou**
- TDT data access: TDT Python SDK
- Numerical and signal processing: Python, NumPy, SciPy
- Desktop UI and plotting: PySide6, pyqtgraph
- Application packaging: PyInstaller

TDT and NeuroExplorer are trademarks or product names of their respective owners. This application is an independent analysis and visualization tool and does not imply third-party endorsement.

## 20. Reporting Recommendations

For figures or methods, record the application name and version, Signal gain, power mode, frequency range, actual Δf, window, Δt, detrend method, Gaussian width, and the normalization range used for Percentage power.
