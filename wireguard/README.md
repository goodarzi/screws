WireGuard PostUp and PreDown rules for iptables.

Add PostUp and PreDown options to wireguard(wg-quick) configuration files usually placed in `/etc/wireguard/wg0.conf`

```ini
PostUp = /etc/iptables/wg-up-iptables %i
PreDown = /etc/iptables/wg-down-iptables %i
```