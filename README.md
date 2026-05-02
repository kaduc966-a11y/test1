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
