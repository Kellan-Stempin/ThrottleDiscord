# ThrottleDiscord.bat

This script is a **quick and dirty way to throttle Discord's bandwidth** on Windows by limiting the MTU (Maximum Transmission Unit) size on your network interfaces. It's useful if you want to conserve bandwidth or reduce Discord's resource usage without third-party software.

---

## Disclaimer

This script **affects all traffic** on your Ethernet and Wi-Fi interfaces — not just Discord. Use with caution. For more precise bandwidth control, consider more advanced tools (like QoS rules or a firewall).

---

## What It Does

- Disables the `Teredo` tunneling interface (used for IPv6 over IPv4).
- Sets the **MTU to 576 bytes** on both `Ethernet` and `Wi-Fi` interfaces.
- Adds noticeable latency and fragmentation, reducing Discord's bandwidth usage.
- Shows basic console output for user awareness.

---

## Usage

1. **Download the script**:  
   Clone the repo or copy `ThrottleDiscord.bat`.

2. **Run as Administrator**:
   Right-click the script and choose **Run as Administrator**. This is required for `netsh` to apply changes.

3. **Monitor Effects**:
   Use Task Manager or Resource Monitor to observe bandwidth reduction.

---

## Reverting the Changes

If you want to return to normal internet performance, run this in an **admin Command Prompt**:

```bat
netsh interface ipv4 set subinterface "Ethernet" mtu=1500 store=persistent
netsh interface ipv4 set subinterface "Wi-Fi" mtu=1500 store=persistent
netsh interface teredo set state default
