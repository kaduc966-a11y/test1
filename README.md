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
- 🖥️ Multi-Window / Freeform / Split Screen

---

## 📋 Danh sách chức năng (70+)

### 🔧 System & Root
- Kiểm tra & sử dụng quyền root (su -c)
- Tự động cài dependencies (sqlite, curl, wget, grep, procps)
- Bật Multi-Window / Freeform / Split Screen

### 📦 Package Management
- Scan tất cả Roblox packages đã cài trên máy
- Hỗ trợ multi-clone (com.roblox.client, com.roblox.client.2, v.v.)
- Menu chọn package để thao tác

### 🔍 Status Detection (3 chế độ)
- **Full check**: Logcat + File log + Cookie + API Presence
- **Fast-path**: Chỉ check workspace activity (nhanh nhất)
- **Batched**: Gộp nhiều shell command 1 lần (tối ưu)
- Detect VNG popup, white screen stuck, crash signals
- Inject Lua heartbeat để phát hiện kick realtime

### 📊 Data Extraction
- Parse userId, gameId từ logcat
- Đọc userId từ cookie database & SharedPreferences
- Lấy PlaceID từ intent activity
- Đọc raw .ROBLOSECURITY cookie
- Session cookie verification

### 🍪 Cookie & Login
- Login bằng cookie (.ROBLOSECURITY)
- Chèn/sửa cookie vào Roblox database
- Export cookie (che bớt sensitive data)
- Fix/tạo lại cookie database bị lỗi
- Kiểm tra cookie tất cả packages cùng lúc
- Đăng xuất Roblox an toàn

### 🌐 Roblox API Integration
- Lấy X-CSRF-TOKEN tự động
- Fetch auth ticket để join game
- Kiểm tra trạng thái online (Presence API)
- Lấy username từ userId
- Gửi webhook Discord thông báo realtime

### 🚀 Game Join & Rejoin
- Join game bằng deeplink/intent
- Join VIP server bằng share link/code
- PlaceID riêng cho từng package
- VIP code riêng cho từng package
- Xác nhận join thành công (verify loop)
- **Auto Rejoin loop** — detect kick & rejoin tự động

### 📜 Delta Auto Execute
- Tự động setup script vào thư mục autoexec
- Quản lý autoexec cho tất cả packages
- Thêm/xóa script Delta dễ dàng

### 🎛️ Menu & UI
- Menu chính với đầy đủ options
- Menu VIP Server join
- Menu set PlaceID per-package
- Menu debug status chi tiết
- Menu fix lag & tối ưu

### 🗂️ Config Management
- Load/Save config từ file properties
- Hỗ trợ multi-tab configuration
- Kiểm tra status tất cả tabs

---

## Setup (chạy trong Termux)
```
. <(curl -sL https://raw.githubusercontent.com/kaduc966-a11y/test1/main/setup.sh)
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
