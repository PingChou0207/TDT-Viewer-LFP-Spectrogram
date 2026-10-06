# TDT_viewer_video_spectrogram_v4 完整使用手冊

版本 4.0｜更新日期：2026-10-06

## 1. 軟體用途

TDT_viewer_video_spectrogram_v4 是唯讀的桌面分析與檢視工具，可載入 TDT block，在同一時間軸同步顯示 Epoch events、多通道 LFP traces、多通道 LFP spectrograms 與多通道 MU traces。

程式不修改原始 TDT block。顯示設定可自動保留；`.tdtv` session 另可保存資料快取與完整工作狀態。

## 2. 安裝與開啟

### macOS

- 目前提供 Apple Silicon arm64 版本。
- 解壓縮 ZIP，將 `TDT_viewer_video_spectrogram_v4.app` 拖到 Applications。
- 第一次啟動時對 App 按 Control-click 或右鍵，選擇 Open。
- 本版為 ad-hoc signed，未經 Apple notarization。

### Windows

- 適用 Windows 10/11 x64。
- 解壓完整 ZIP，再開啟 `TDT_viewer_video_spectrogram_v4.exe`。
- EXE 旁的 `_internal` 資料夾不可刪除或分開移動。

## 3. 快速開始

1. 開啟 App，按 **Open Block**。
2. 選擇一個完整的 TDT block 資料夾。
3. 在 **Streams** 確認 `LFP_`、`MUs_` 是否勾選。
4. 在 **LFP ch**、**MU ch** 與 **Spectrogram ch** 選擇通道。
5. 在 **Epochs** 選擇要顯示的事件。
6. 使用底部滑桿、時間欄位或 `1/4W` 按鈕移動時間視窗。
7. 調整 gain、amplitude、channel spacing、scale bar 或 spectrogram 參數。
8. 在右側圖表按右鍵，可調整 grid、線寬或輸出圖片。

目前 LFP trace 與 spectrogram 使用名稱為 `LFP_` 的 stream；MU trace 使用 `MUs_`。其他名稱仍會列在 Streams，但不會自動映射到這兩種 panel。

## 4. 主畫面與面板

右側由上而下為 Epoch、LFP、Spectrogram、MU 四個 panel，時間軸同步。拖曳 panel 之間的水平分隔線可調整高度。

| 區域 | 功能 |
|---|---|
| 左側設定面板 | Block、stream、channel、epoch、cursor、trace 與 spectrogram 設定。 |
| 右側圖表 | 同步顯示 Epoch、LFP、Spectrogram、MU。 |
| 底部導覽列 | 顯示/隱藏設定面板、移動時間、輸入起始時間。 |
| Status bar | 顯示 block path、gain、載入、複製與輸出狀態。 |

可折疊區塊按一下標題即可展開或收合。

### Camera 影片同步

若 TDT block 同時包含 `Cam1`（或其他 `Cam#`）epoc 與對應的 `Cam1.avi`／`Cam1.mp4` 影片，左側 **Camera** 按鈕會啟用。按下後，影片視窗會停靠在圖表旁，可拖曳邊界調整寬度。多部 camera 可在影片視窗頂端切換。

- 底部時間滑桿與時間欄位移動後，Camera 顯示該 TDT 時間點最近一格已記錄的影格；在第一個 camera timestamp 之前保持空白。
- 在任一圖表雙擊，可預覽該時間的影格。影片視窗的 **◀ Frame**、**Frame ▶** 逐格跳轉，並同步圖表 cursor；**Play/Pause** 按 TDT 時間播放，cursor 會跟著移動。播放到視窗外時，圖表會自動移動時間範圍。
- 對齊依 `Cam#` epoc 的 onset 與影格編號，而不是只用 AVI 標示的 fps。若影片尾端有多餘影格但沒有對應 timestamp，不將其視為同步資料。
- `.tdtv` 會保存 camera timestamp 與原始 block 路徑，**不會嵌入大型影片檔**；從 session 恢復 camera 時仍須能存取原本的 AVI／MP4。

## 5. 頂端按鈕與資料管理

| 按鈕 | 功能 |
|---|---|
| Open Block | 選擇並讀取 TDT block。載入新 block 時時間與 cursor 回到 0 秒。 |
| Open Session | 開啟 `.tdtv`，從 session 內的快取恢復資料與畫面。 |
| Save Session | 儲存 `.tdtv`，包含 stream data、epoch onsets、通道與顯示設定。 |
| New Viewer | 選擇另一個 block，另開獨立 viewer 視窗；原視窗保留。 |
| Credits | 顯示版本、開發 credit、第三方科學與軟體元件。 |

### Block 與 Streams

- **Block** 顯示目前 block 路徑。
- **Streams** 控制啟用的 streams。取消 `LFP_` 會隱藏 LFP trace 與 spectrogram；取消 `MUs_` 會隱藏 MU trace。
- 開啟 block 後，所有發現的 stream 預設勾選。

## 6. Channel 選擇

- **LFP ch** 控制 LFP trace 通道。
- **MU ch** 控制 MU trace 通道。
- **Spectrogram ch** 控制 spectrogram 通道；首次載入時跟隨 LFP 的預設通道。
- 預設選取每個可用 trace stream 的前 8 個通道。
- 點擊區塊標題可展開逐一勾選。
- Double-click channel 區塊標題，可輸入 `1,2,5-8`、`all` 或 `none` 批次選擇。
- 通道輸入採 1-based 編號；畫面標籤顯示 `ch1`、`ch2` 等。

## 7. Epoch 顯示與定位

### Epochs

- 勾選一個或多個 epoch name 後，Epoch panel 顯示每次 onset。
- 選中的 epoch onset 也會以垂直線疊加到 spectrogram。
- 若 block 有 `PC3_`，預設選取 `PC3_`；否則選取第一個可用 epoch。

### Epoch jump

1. 在 **Epoch name** 選擇事件。
2. 在 **Tick index** 輸入第幾個 onset。
3. `Prev` 跳到前一個 tick，`Jump` 跳到指定 tick，`Next` 跳到下一個 tick。
4. 下方會顯示該 tick 的時間與總 tick 數。

跳轉後，事件時間成為目前視窗的左側起始時間。

## 8. Cursor

- Double-click 任一圖表，在該時間設定 cursor。
- **Show cursor on traces** 在所有 panel 顯示同步垂直 cursor。
- **Jump to Cursor** 將 cursor time 設為目前視窗起始時間。
- **Copy Cursor Time** 以 6 位小數複製秒數到剪貼簿。
- Cursor time 會保存在 session 與本機偏好設定中。

## 9. 時間軸與版面操作

| 控制項 | 功能 |
|---|---|
| Window length | 畫面顯示長度，範圍 0.1-600 秒，預設 5 秒。 |
| 底部滑桿 | 連續移動目前視窗的起始時間。 |
| 時間欄位 | 直接輸入起始時間，精度 0.001 秒。 |
| `← 1/4W`、`1/4W →` | 每次向前或向後移動四分之一個 Window length。 |
| Hide / Show | 收起或顯示左側設定面板。 |
| X-axis display | `Bottom only` 只在最下方顯示時間軸；`All panels` 在 LFP、Spectrogram、MU 都顯示。 |

四個圖表不能用滑鼠自由縮放或平移，避免 panel 時間軸失去同步；請使用上述導覽控制項。

## 10. LFP 與 MU trace 顯示

顯示公式：`display = raw / Signal gain × stream amplitude + channel offset`

| 設定 | 功能 |
|---|---|
| LFP_ amplitude | 只改變 LFP trace 顯示倍率，不改變資料或 spectrogram。 |
| MUs_ amplitude | 只改變 MU trace 顯示倍率。 |
| Signal gain | 原始 LFP/MU 與 spectrogram 計算前共同除以此值；應填 acquisition chain 實際 gain。 |
| Channel spacing | 改變相鄰 trace 與 epoch rows 的垂直間距。 |
| White/black | 勾選為白底黑線；取消為黑底白線。 |
| Show scale bar | 顯示或隱藏 LFP/MU panel 右側 scale bar。 |
| LFP_ scale bar | 設定 LFP scale bar 的 µV 標示值，預設 500 µV。 |
| MUs_ scale bar | 設定 MU scale bar 的 µV 標示值，預設 100 µV。 |

為提升顯示速度，LFP trace 在目前視窗內最多約繪製 4000 個顯示點；這只影響 trace rendering，不修改原始資料，也不影響 spectrogram 計算。MU trace 保持逐點顯示。

## 11. 圖表右鍵選單與圖片輸出

| 選項 | 功能 |
|---|---|
| Show Grid | 開關 trace panel 的共用時間與 channel grid。 |
| Line Width | 選擇 0.5、1、1.5、2 或 3 px。 |
| Save image includes settings panel | 關閉時只輸出右側圖表；開啟時包含左側設定面板。 |
| Export Plot as Image | 依目前螢幕尺寸輸出 PNG 或 JPEG。 |
| Export Publication PNG | 以 1-6 倍比例重新渲染 PNG；預設 3 倍，寫入 300 DPI metadata。 |

輸出內容依目前畫面，包括主題、grid、cursor、epoch、通道、color bar 與 panel 高度。

## 12. Spectrogram 顯示模式

- **Real power** 顯示 `dB re 1 µV²/Hz`。程式假設 raw/gain 後訊號單位為 volts。
- **Percentage power** 將每個 channel、每個 time bin 在目前顯示頻率範圍內正規化為 100%。
- 切換模式時 Color min/max 自動切至預設範圍：Real power `-20` 至 `40 dB`；Percentage power `0` 至 `5%`。
- 多通道 spectrogram 垂直排列，各 channel 有獨立頻率刻度，但共用 color bar。
- **Color map** 可選 `viridis` 或 `jet`。

## 13. Spectrogram preprocessing 與 STFT

| 參數 | 功能 |
|---|---|
| Show | 顯示或隱藏 spectrogram panel。 |
| Detrend | `None`、`Constant` 或 `Linear`；每個 STFT window 計算前執行。 |
| Min/Max freq | 顯示頻率範圍；Percentage power 也使用此範圍正規化。 |
| Freq resolution | 目標 frequency-bin spacing，預設 0.5 Hz。 |
| STFT window | Hann window 長度，預設 2 秒。 |
| Max time step | 相鄰 time bins 的最大間隔，預設 0.5 秒。 |
| Overlap | 使用者要求的 overlap，範圍 0-95%，預設 75%。 |

若 STFT window 小於 `1 / Freq resolution`，程式會自動延長有效 window。程式也會自動提高 overlap，以滿足 Max time step。設定區底部與 spectrogram title 會顯示實際 analysis fs、Δf、Δt 與 window。

### 時頻解析度

| Frequency resolution | 最短合理 window | 建議 Max time step |
|---:|---:|---:|
| 0.5 Hz | 2 s | 0.25-0.5 s |
| 1 Hz | 1 s | 0.1-0.25 s |
| 2 Hz | 0.5 s | 0.05-0.1 s |

較小的 Max time step 只讓估計位置更密，不會縮短每個估計所整合的 window。例如 2 秒 window 即使 Δt 為 0.01 秒，每個 time bin 仍使用約 2 秒訊號。

### 為什麼錄影起始處的 spectrogram 會留白？（數學與程式計算）

Spectrogram 使用完整的 Hann 視窗計算 PSD，並將每個結果的時間標在該視窗的**中心**，不是視窗的左端。設分析取樣率為 `fs`、有效視窗樣本數為 `N`、相鄰視窗位移為 `H`，則約有

`W = N / fs`，`Δt = H / fs`，`t_k = t₀ + W/2 + kΔt`。

其中 `t₀` 是可讀取資料片段的起點，`t_k` 是第 `k` 個 STFT time bin 的中心。程式會讀取目前顯示範圍前後的額外資料，因此一般瀏覽錄影中段時，`t₀` 可以早於畫面的左緣；但在**整段錄影的起點**，讀取範圍會被限制在原始資料的 `start_time`，不會在起點之前補零或虛構訊號。第一個完整視窗必須累積約 `W` 秒的資料，所以第一個結果中心約在 `start_time + W/2`。

程式計算方式可概括為：

```python
W_requested = max(STFT_window, 1 / Freq_resolution)
N = min(max(8, round(STFT_window * fs), ceil(fs / Freq_resolution)), available_samples)
NFFT = max(N, round(fs / Freq_resolution))
H = N - noverlap  # overlap 會視 Overlap 和 Max time step 自動提高
freq, rel_time, psd = scipy.signal.spectrogram(
    samples, fs=fs, window="hann", nperseg=N, noverlap=noverlap,
    nfft=NFFT, scaling="density", mode="psd"
)
absolute_time = segment_start + rel_time
```

上式的 `W_requested` 說明設定邏輯；實際 `N` 若受可用資料長度限制，視窗可能較短。`NFFT` 決定顯示頻率格點間距 `fs/NFFT`；補零可使格點更密，**不會**增加短資料本身的真實頻率辨識能力。

顯示時，第一個 time bin 的色塊由中心向左延伸約 `Δt/2`，所以第一段顏色約從 `start_time + W/2 − Δt/2` 出現。以預設 `Freq resolution = 0.5 Hz`、`STFT window = 2 s`、`Overlap = 75%`、`Max time step = 0.5 s` 為例，`W ≈ 2 s`、`Δt ≈ 0.5 s`：第一個 PSD 標在約 `1.0 s`，色塊左緣約在 `0.75 s`。這段起始留白是完整視窗與中心時間標記造成的，**不代表原始 LFP 沒有資料**。若錄影很短、取樣率或 overlap 不同，實際位置以圖上顯示的 `window`、`Δt` 為準。

## 14. Spectrogram post-processing

### NeuroExplorer-compatible Gaussian smoothing

- 勾選 **Gaussian smoothing - Enable** 後啟用。
- **Filter width** 是 Gaussian 在半高處的寬度，單位為 frequency bins，可輸入小數，預設 3 bins。
- Filter 只沿頻率軸處理，不沿時間軸 smoothing。
- Percentage power smoothing 後會再次正規化為 100%。

Kernel：`f[i] = exp(-i² / sigma) / norm`，其中 `i = -2d ... 2d`、`d = (int(w) + 1) // 2`、`sigma = -w² × 0.25 / log(0.5)`。

## 15. Spectrogram downsampling

- 原始 LFP 約 1-2 kHz 時維持 native sampling rate。
- 原始取樣率高於 2 kHz，且降低取樣率有意義時，先用 anti-alias polyphase filtering，再 resample。
- 目標 analysis fs 至少約 1 kHz，並確保 `Max freq <= 0.45 × analysis fs`。
- Spectrogram 會在目前畫面前後讀入 padding，降低視窗邊界效應。
- 實際 analysis fs 會標示 `native` 或顯示原始取樣率。

## 16. Session、偏好設定與 Reset

### Save/Open Session

- `.tdtv` 保存所有已讀取 stream arrays、sampling rate、start time、epochs、cursor、通道、時間位置、panel 高度與顯示設定。
- 因為包含資料快取，session 檔可能很大，但可在沒有原始 block 的情況下恢復畫面。
- `.tdtv` 使用 Python pickle 格式，只能開啟可信來源的檔案。

### 自動保存偏好

關閉視窗時，App 會記住視窗大小、時間位置、主題、grid、gain、通道、epochs、spectrogram 設定與 panel 高度。重新開啟 App 後會恢復顯示偏好，但不會把原始 block data 自動載入；請再次 Open Block 或 Open Session。

### Reset

Reset 會恢復主要 trace/display 預設值：5 秒 window、amplitude 1、gain 1、spacing 1、白底、grid、scale bar、line width 1、Bottom only。Reset 不會重新載入資料，也不會清除 channel/epoch 選擇或 spectrogram 參數。

## 17. 建議工作流程

1. 載入 block，確認 Streams、channel 數、sampling rate 與 Epochs。
2. 填入正確 Signal gain，再設定 amplitude 與 scale bar。
3. 用較少 channel 先確認 trace 與事件對齊。
4. 設定 spectrogram 頻率範圍、解析度與時間步距。
5. Real power 比較絕對強度；Percentage power 比較頻譜組成。
6. 完成後 Save Session；需要圖稿時使用 Publication PNG。

## 18. 疑難排解

| 問題 | 處理方式 |
|---|---|
| 找不到 LFP | 確認 block 內有名稱完全相同的 `LFP_` stream，且資料不是空陣列。 |
| 找不到 MU | 確認 block 內有 `MUs_` stream，並在 Streams 與 MU ch 勾選。 |
| Spectrogram 空白 | 確認 Show、`LFP_` stream、Spectrogram ch、Min/Max freq 與 Color min/max。 |
| Epoch 不顯示 | 在 Epochs 勾選事件，並確認目前時間視窗涵蓋 onset。 |
| Trace 太小或重疊 | 檢查 Signal gain，調整 amplitude 與 Channel spacing。 |
| 畫面更新慢 | 減少 spectrogram channels、縮短 Window length、提高 Max time step 或縮小頻率範圍。 |
| Session 很大 | `.tdtv` 內含所有 stream data；若只需圖片，不必保存 session。 |
| macOS 無法開啟 | Control-click App 選 Open；可信檔案仍受阻時移除 quarantine。 |
| Windows 無法啟動 | 完整解壓 ZIP，保留 EXE 與 `_internal` 在同一資料夾。 |

macOS quarantine 指令：`xattr -dr com.apple.quarantine "/Applications/TDT_viewer_video_spectrogram_v4.app"`

## 19. Windows 原生建置

1. 安裝 64-bit Python 3.12，勾選 Add Python to PATH。
2. 將完整 project folder 複製到 Windows。
3. Double-click `build_windows.bat`。
4. 完成後使用 `dist/TDT_viewer_video_spectrogram_v4_Windows_x64.zip`。

也可將 project 推送到 GitHub，執行 `.github/workflows/build-apps.yml`，下載 Windows x64 artifact。

## 20. Credits

- Application design and development: **PingChou**
- Scientific and software components: TDT Python SDK, Python, NumPy, SciPy, PySide6, pyqtgraph, PyInstaller
- NeuroExplorer-compatible Gaussian smoothing 依其公開演算法形式實作；NeuroExplorer 為其權利人之產品名稱。
- TDT 為其權利人之商標或產品名稱。本軟體是獨立的分析與視覺化工具，不代表第三方廠商背書。

若要對外發表由本工具產生的圖，建議在 Methods 或 figure legend 記錄軟體名稱、版本、power mode、frequency range、Δf、window、Δt、detrend、smoothing 與 Signal gain。
