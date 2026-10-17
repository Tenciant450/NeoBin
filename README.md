[**English**](README.en-US.md) | **简体中文**

# Neobin ⚡

> **无容器，无 Proot，真正的 Android Root 环境 Termux 原生桥接模块。**

**Neobin** 是一个专为 Android Root 环境打造的 KernelSU/Magisk 模块。它打破了 Android 底层沙盒封锁，让你可以在 Root Shell 中无缝、原生地调用 Termux 的 `apt`、`pkg` 以及全套 GNU 工具链。

### 🚨 警告与前提条件
> ⚠️ **致命警告**：**绝对禁止**在普通（非 Root）的 Termux 环境中 `export` 本模块的路径，这会导致 `su` 命令无限套娃，直接卡死你的设备！
> 
> ⚠️ **免责声明**：本模块处于早期开发阶段。刷入第三方模块存在风险，请确保你了解基础的终端操作。刷机有风险，变砖需自理。

**前提条件：**
- 已获取 Root 权限的设备（支持 KernelSU 或 Magisk）。
- 必须已安装 [Termux](https://termux.dev/) 应用，且能正常运行。
- 了解基础的终端命令操作。

### ✨ 核心特性
- **🛡️ 完美降权 (DAC 绕过)**：自动获取 Termux 的真实 UID，通过 `su -l <uid>` 动态降权，完美骗过 `apt` 的 Root 检测机制。
- **🌐 网络全打通 (MAC 绕过)**：强制附加 `-G 3003` (inet 组)，彻底解决 Root Shell 下调用 Termux 网络工具时的 DNS 解析失败问题。
- **📦 环境注入**：自动挂载 `PREFIX` 和 `LD_LIBRARY_PATH`，无需手动 `export`，彻底告别动态库缺失。
- **🎨 现代化 WebUI**：基于 KernelSU WebUI 打造的高颜值控制台，一键检测 UID、验证环境连通性。
- **🪶 零体积**：没有任何冗余二进制文件，纯 Shell 脚本驱动。

### 🧠 底层原理解析
在 Android 下直接以 Root 身份运行 `apt` 会触发 UID 拦截，而切换普通用户又会丢失 SELinux 上下文和网络权限。Neobin 通过以下命令打破死结：

```bash
su -l <Termux_UID> -G 3003 -c "export PREFIX=/data/data/com.termux/files/usr; apt ..."
```

利用 KernelSU 支持的 su 参数，同时完成 降低 UID、附加网络权限组、注入环境变量 三步操作。

🚀 安装与使用

1. 前往本仓库的 Releases 页面下载最新的 Neobin.zip。
2. 在 Root 管理器中刷入该模块。
3. 打开 KernelSU 管理器，点击模块旁边的 < > 图标进入 WebUI，点击 “自动检测并配置 UID”。
4. 打开终端，进入 su，直接敲 apt update 或 pkg install python，享受丝滑！

---

<div align="center">
  <b>Developed by Tenciant450</b>
</div>
