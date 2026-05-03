# SieuThiRoblox Rejoin v2.1

[![Discord](https://img.shields.io/badge/Discord-Join%20Server-5865F2?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/2rWZxb3p27)

Tham gia server Discord để được hỗ trợ và cập nhật mới nhất:

👉 **[https://discord.gg/2rWZxb3p27](https://discord.gg/2rWZxb3p27)**

---

## ⭐ Features

### Core
- 🔄 **Auto Rejoin** — Tự động phát hiện kick/disconnect/crash và rejoin game
- 🍪 **Login via Cookie** — Đăng nhập bằng `.ROBLOSECURITY` cookie
- 📦 **Multi-package** — Hỗ trợ nhiều bản Roblox clone cùng lúc
- 🔍 **Smart Detection** — Kết hợp Logcat + Lua heartbeat + API Presence để detect chính xác
- 📊 **Webhook Discord** — Thông báo trạng thái rejoin realtime

### 🆕 v2.1 — New Features
- 🌐 **VIP Server Join** `[24]` — Join VIP server bằng share link hoặc code
- 🎯 **Per-package PlaceID** `[25]` — Set PlaceID riêng cho từng package (game khác nhau)
- 🐛 **Debug Status** `[26]` — Xem chi tiết PID, memory, uptime, kick signals, logcat
- 📜 **Auto Execute All** `[18]` — Thêm/xóa script Delta cho tất cả packages cùng lúc
- 🔒 **VIP Auto-Rejoin** — Tự động rejoin VIP server khi bị kick (per-package)

### Các tính năng khác
- 🚀 Fix Lag / Tối ưu hiệu suất
- 🔄 Auto-change account
- 📋 Export/Import cookie
- 🔎 Scan & Auto-add Roblox packages
- ⏱️ Tùy chỉnh timeout (NoGame/WhiteScreen)
- 🛡️ Anti-VNG popup detect

---

## 📋 Full Function List (70 functions)

### 🔧 System & Root
| Function | Mô tả |
|---|---|
| `checkRoot()` | Kiểm tra root access |
| `root(command)` | Chạy lệnh với quyền root (su -c) |
| `rootOut(command)` | Chạy lệnh root và trả về output |
| `shellQuote(value)` | Escape shell argument an toàn |
| `ensureDependencies()` | Cài sqlite, curl, wget, grep, coreutils, procps |
| `enableMultiWindow()` | Bật Multi-Window / Freeform / Split Screen |

### 📦 Package Management
| Function | Mô tả |
|---|---|
| `isRobloxPackage(pkg)` | Kiểm tra package có phải Roblox không |
| `candidatePackages(props)` | Scan tất cả Roblox packages đã cài |
| `selectedPackages(props)` | Lấy danh sách packages đang được chọn |
| `pickOnePackage(props)` | Menu chọn 1 package cụ thể |
| `openPackage(pkg)` | Mở app Roblox package |

### 🔍 Status Detection (3 mode)
| Function | Mô tả |
|---|---|
| `checkStatus(pkg)` | Full check: logcat + file + cookie + API |
| `checkStatusFast(pkg)` | Fast-path: chỉ check workspace activity |
| `checkStatusBatched(pkg)` | Batched: gộp nhiều shell command 1 lần |
| `printStatus(pkg)` | In status chi tiết ra terminal |
| `colorStatus(status)` | Tô màu status string (running/stopped/crashed) |
| `hasVngPopup(pkg)` | Detect VNG popup chặn game |
| `hasWhiteScreenStuck(pkg)` | Detect white screen bị stuck |
| `robloxFileLogSignal(pkg)` | Đọc file log signal kick |
| `robloxDebugText(pkg)` | Lấy debug text từ Roblox |

### 📊 Data Extraction
| Function | Mô tả |
|---|---|
| `extractFirst(text, patterns)` | Extract value đầu tiên match pattern |
| `sessionCookieExists(pkg)` | Kiểm tra session cookie tồn tại |
| `userIdFromLogs(text)` | Parse userId từ logcat |
| `gameIdFromLogs(text)` | Parse gameId từ logcat |
| `getUserIdFromCookieDb(pkg)` | Lấy userId từ cookie database |
| `getUserIdFromSharedPrefs(pkg)` | Lấy userId từ SharedPreferences |
| `getPlaceIdFromIntent(pkg)` | Lấy PlaceID từ intent activity |
| `getRawCookieFromDb(pkg)` | Lấy raw .ROBLOSECURITY cookie |
| `sha256Short(value)` | SHA-256 hash rút gọn |

### 🍪 Cookie & Login
| Function | Mô tả |
|---|---|
| `loginCookieTab(props)` | Menu login bằng cookie |
| `insertRawCookie(pkg, cookie)` | Chèn cookie vào database |
| `exportCookieRedacted(pkg)` | Export cookie (che bớt) |
| `printCookieInfo(pkg)` | In thông tin cookie chi tiết |
| `checkSelectedCookies(props)` | Kiểm tra cookie tất cả packages |
| `fixCookieDb(pkg)` | Sửa/tạo lại cookie database |
| `logoutRoblox(pkg)` | Đăng xuất Roblox |

### 🌐 Roblox API
| Function | Mô tả |
|---|---|
| `fetchCsrfToken(cookie)` | Lấy X-CSRF-TOKEN từ Roblox API |
| `fetchAuthTicket(cookie, csrf, placeId)` | Lấy auth ticket để join game |
| `fetchPresenceType(userId)` | Kiểm tra trạng thái online (Presence API) |
| `fetchUsername(userId)` | Lấy username từ userId |
| `fetchDynamicValue(data, props)` | Fetch dynamic value từ server |
| `sendWebhook(...)` | Gửi webhook Discord thông báo |

### 🚀 Game Join & Rejoin
| Function | Mô tả |
|---|---|
| `startPlace(...)` | Join game bằng deeplink/intent |
| `startVipServer(pkg, shareCode, props)` | Join VIP server |
| `verifyJoin(...)` | Xác nhận đã join thành công |
| `parseVipLink(url)` | Parse share code từ VIP link |
| `getPlaceIdForPackage(pkg, props)` | Lấy PlaceID cho package cụ thể |
| `getVipCodeForPackage(pkg, props)` | Lấy VIP code cho package |
| `autoRejoin(props)` | **Loop chính** — auto detect & rejoin |
| `ensureLuaKickDetector(pkg)` | Inject Lua heartbeat detect kick |

### 📜 Delta Auto Execute
| Function | Mô tả |
|---|---|
| `getDeltaAutoExecPath(pkg)` | Lấy path thư mục autoexec |
| `setupAutoExec(pkg)` | Cài script vào autoexec |
| `deleteAutoExec(pkg)` | Xóa script autoexec |
| `autoExecTab(props)` | Menu quản lý autoexec tất cả packages |

### 🎛️ Menu & UI
| Function | Mô tả |
|---|---|
| `printMenu(props)` | In menu chính |
| `joinVipServerMenu(props)` | Menu join VIP server |
| `setPlaceIdPerPackageMenu(props)` | Menu set PlaceID per-package |
| `debugStatusMenu(props)` | Menu debug status chi tiết |
| `fixLagMenu(props)` | Menu fix lag |

### 🗂️ Config & Tabs
| Function | Mô tả |
|---|---|
| `loadConfig()` | Load config từ file properties |
| `saveConfig(props)` | Lưu config |
| `parseCsv(value)` | Parse chuỗi CSV |
| `parseTabLine(line)` | Parse dòng tab config |
| `loadTabsFromFile(props)` | Load tabs từ file |
| `checkAllTabs(props)` | Kiểm tra status tất cả tabs |

### 🛠️ Utilities
| Function | Mô tả |
|---|---|
| `prompt(label)` | Nhập input từ user |
| `pause()` | Chờ user nhấn Enter |
| `hasAny(text, words)` | Kiểm tra text chứa bất kỳ word nào |
| `okMark(ok)` | Trả về ✓ hoặc ✗ |
| `urlEncode(value)` | URL encode string |

---

## 🔒 Obfuscation (14 Layers)

| # | Layer | Type |
|---|---|---|
| 1 | String Pool Encryption (822 strings) | Source |
| 2 | Interpolated String Encryption | Source |
| 3 | Function Shuffle (Luraph-style) | Source |
| 4 | Dead Code Injection | Source |
| 5 | Opaque Predicates | Source |
| 6 | Anti-Tamper Checks | Source |
| 7 | Function Proxy Wrapping | Source |
| 8 | Advanced Fake Functions + Variables | Source |
| 9 | Control Flow Flattening (State Machine) | Source |
| 10 | Anti-Debug (TracerPid/JDWP/env) | Runtime |
| 11 | Anti-Dump/Frida/Xposed (/proc scan) | Runtime |
| 12 | JAR Integrity Self-Hash (SHA-256) | Runtime |
| 13 | ProGuard (shrink+optimize+rename+repackage) | Bytecode |
| 14 | yGuard (2nd pass rename + overload) | Bytecode |

---

## Setup (chạy trong Termux)
```
. <(curl -sL https://raw.githubusercontent.com/kaduc966-a11y/rejoin-tool/main/setup.sh)
```

## Chạy tool (with root)
```
su -c "export PATH=$PATH:/data/data/com.termux/files/usr/bin && export TERM=xterm-256color && cd /data/data/com.termux/files/home && java -noverify -jar main_obfuscated.jar"
```

## Chạy thủ công (trong Termux)
```
./run_jar.sh
```

## Termux Boot (tự chạy khi khởi động)
Đã được setup tự động bởi setup.sh. Nếu muốn tắt:

```
rm ~/.termux/boot/rejoin.sh
```

## Stop tool
```
su -c "pkill -f java"
```

## Yêu cầu
- Termux (F-Droid version)
- Termux Boot (F-Droid version)
- Root access
- Java (OpenJDK) - tự cài bởi setup.sh

## APK cần thiết
[https://f-droid.org/repo/com.termux_1022.apk](https://f-droid.org/repo/com.termux_1022.apk)
[https://f-droid.org/repo/com.termux.boot_1000.apk](https://f-droid.org/repo/com.termux.boot_1000.apk)
