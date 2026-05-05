#!/bin/bash
# ================================================
# Sieuthi Rejoin v2.0 - Auto Setup Script
# Chay trong Termux: . <(curl -sL URL/setup.sh)
# ================================================

REPO="https://raw.githubusercontent.com/kaduc966-a11y/test1/main"
HOME_DIR="/data/data/com.termux/files/home"
TERMUX_BOOT_APK="https://f-droid.org/repo/com.termux.boot_1000.apk"

echo "╔═══════════════════════════════════════╗"
echo "║   Sieuthi Rejoin v2.0 - Auto Setup    ║"
echo "╚═══════════════════════════════════════╝"
echo ""

# 0. Kiem tra dang chay trong Termux
if [ -z "$TERMUX_VERSION" ] && [ ! -d "/data/data/com.termux" ]; then
    echo "[!] Ban phai chay script nay trong TERMUX!"
    echo "[!] Tai Termux tai: https://f-droid.org/repo/com.termux_1022.apk"
    exit 1
fi

# 1. Setup Termux storage (cho phep truy cap /sdcard)
echo "[1/7] Setup Termux storage..."
if [ -e "$HOME_DIR/storage" ]; then
    rm -rf "$HOME_DIR/storage"
fi
termux-setup-storage 2>/dev/null
sleep 2

# 2. Dam bao curl co san
echo "[2/7] Kiem tra curl..."
if ! command -v curl >/dev/null 2>&1; then
    echo "  -> Cai dat curl..."
    yes | pkg install curl -y
fi

# 3. Update & install dependencies
echo "[3/7] Update packages..."
yes | pkg update -y 2>/dev/null
yes | pkg upgrade -y 2>/dev/null

# 4. Install Java (OpenJDK)
echo "[4/7] Cai dat Java..."
if ! command -v java >/dev/null 2>&1; then
    echo "  -> Installing openjdk-17..."
    yes | pkg install openjdk-17 -y
else
    echo "  -> Java da co san."
fi

# 5. Cai Termux Boot (tu dong chay khi khoi dong)
echo "[5/7] Kiem tra Termux Boot..."
if ! pm list packages 2>/dev/null | grep -q "com.termux.boot"; then
    echo "  -> Dang tai Termux Boot APK..."
    curl -sL "$TERMUX_BOOT_APK" -o /data/local/tmp/termux_boot.apk
    if [ -f /data/local/tmp/termux_boot.apk ]; then
        echo "  -> Dang cai dat Termux Boot..."
        su -c "pm install /data/local/tmp/termux_boot.apk" 2>/dev/null
        rm -f /data/local/tmp/termux_boot.apk
        echo "  -> Termux Boot da cai xong."
    else
        echo "  -> [!] Khong tai duoc Termux Boot. Ban co the cai thu cong sau."
    fi
else
    echo "  -> Termux Boot da co san."
fi

# 6. Download tool files tu GitHub
echo "[6/7] Tai tool files..."
cd "$HOME_DIR"

echo "  -> Downloading main_obfuscated.jar..."
curl -sL "$REPO/main_obfuscated.jar" -o "$HOME_DIR/main_obfuscated.jar"

echo "  -> Downloading run_jar.sh..."
curl -sL "$REPO/run_jar.sh" -o "$HOME_DIR/run_jar.sh"
chmod +x "$HOME_DIR/run_jar.sh"

echo "  -> Downloading boot script..."
mkdir -p "$HOME_DIR/.termux/boot"
curl -sL "$REPO/boot_rejoin.sh" -o "$HOME_DIR/.termux/boot/rejoin.sh"
chmod +x "$HOME_DIR/.termux/boot/rejoin.sh"

# Tao config mac dinh neu chua co
if [ ! -f "$HOME_DIR/rejoin-config.properties" ]; then
    echo "  -> Tao config mac dinh..."
    cat > "$HOME_DIR/rejoin-config.properties" << 'CONF'
place_id=
package_name=com.roblox.client
selected_packages=com.roblox.client
job_id=
delay_seconds=8
status_method=combined
join_method=deeplink_package
join_verify_seconds=6
auto_change_package=false
auto_block=false
force_stop=true
webhook_url=
max_retry_kill=5
game_session_wait_seconds=30
CONF
fi

# 7. Verify
echo "[7/7] Kiem tra ket qua..."
if [ -f "$HOME_DIR/main_obfuscated.jar" ]; then
    JAR_SIZE=$(wc -c < "$HOME_DIR/main_obfuscated.jar")
    if [ "$JAR_SIZE" -lt 1000 ]; then
        echo ""
        echo "[!] JAR qua nho ($JAR_SIZE bytes) - co the download loi!"
        echo "[!] Thu lai: curl -sL $REPO/main_obfuscated.jar -o main_obfuscated.jar"
        exit 1
    fi
    echo ""
    echo "╔════════════════════════════════════════════╗"
    echo "║         ✓ SETUP THANH CONG!                ║"
    echo "╠════════════════════════════════════════════╣"
    echo "║                                            ║"
    echo "║  JAR: ${JAR_SIZE} bytes                    ║"
    echo "║  Java: $(java -version 2>&1 | head -1)     "
    echo "║                                            ║"
    echo "║  Chay tool:  ./run_jar.sh                  ║"
    echo "║  Stop tool:  pkill -f java                 ║"
    echo "║                                            ║"
    echo "║  Auto-start: da setup (Termux Boot)        ║"
    echo "║                                            ║"
    echo "╚════════════════════════════════════════════╝"
    echo ""
    echo "Mo Termux Boot 1 lan de kich hoat auto-start!"
else
    echo ""
    echo "[!] Download THAT BAI! Kiem tra internet va thu lai."
    exit 1
fi
