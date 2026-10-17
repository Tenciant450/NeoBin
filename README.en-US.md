**English** | [**简体中文**](README.md)

# Neobin ⚡

> **No container. No proot. Pure native bridge for Termux on Android Root Shell.**

**Neobin** is a KernelSU/Magisk module designed for Android Root environments. It breaks through the Android sandbox restrictions, allowing you to seamlessly and natively call Termux's `apt`, `pkg`, and the full GNU toolchain directly from the Root Shell.

### 🚨 WARNING & PREREQUISITES
> ⚠️ **CRITICAL WARNING**: **DO NOT** `export` this module's path in a normal (non-root) Termux session. Doing so will cause an infinite `su` loop and freeze your device!
> 
> ⚠️ **DISCLAIMER**: This is an early-stage module. Flashing custom modules carries risks. Understand basic terminal operations before use. Use at your own risk.

**Prerequisites:**
- A rooted Android device (KernelSU or Magisk).
- [Termux](https://termux.dev/) must be installed and functioning normally.
- Basic knowledge of terminal commands.

### ✨ Features
- **🛡️ Perfect Privilege Drop (DAC Bypass)**: Automatically retrieves Termux's real UID and uses `su -l <uid>` to drop privileges, perfectly bypassing `apt`'s root detection.
- **🌐 Network Unlocked (MAC Sandbox Bypass)**: Forces the attachment of `-G 3003` (inet group) to resolve DNS failures (`No address associated with hostname`) in Root Shell.
- **📦 Environment Injection**: Automatically mounts `PREFIX` and `LD_LIBRARY_PATH`, eliminating dynamic library missing errors (`CANNOT LINK EXECUTABLE`).
- **🎨 Modern WebUI**: A high-quality console powered by KernelSU WebUI for one-click UID detection and connectivity testing.
- **🪶 Zero Bloat**: No redundant binaries, purely driven by shell scripts.

### 🧠 Under the Hood
Running Termux's `apt` as Root triggers UID blocking, while switching to a normal user loses the SELinux context and network permissions. Neobin solves this deadlock:

```bash
su -l <Termux_UID> -G 3003 -c "export PREFIX=/data/data/com.termux/files/usr; apt ..."
```

By utilizing KernelSU's su parameters, it simultaneously achieves UID dropping, network group attachment, and environment variable injection.

🚀 Installation

1. Download the latest Neobin.zip from the Releases page.
2. Flash the ZIP in your Root manager (KernelSU/Magisk).
3. Open KernelSU Manager, click the < > icon next to the module to enter WebUI, and click "Auto-detect and Configure UID".
4. Open your terminal, type su, then run apt update or pkg install python directly.

---

<div align="center">
  <b>Developed by Tenciant450</b>
</div>
