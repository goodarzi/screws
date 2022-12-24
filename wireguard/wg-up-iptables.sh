#!/bin/sh
dev=$1
port=$(wg show $dev listen-port)
address=$(ip address show dev $dev | grep -oP '(?<=inet )[^ ]*')
defif=$(ip route list default | grep -oP '(?<=dev )[^ ]*')

iptables -C POSTROUTING -t nat -s $address -o $defif -j MASQUERADE || \
iptables -I POSTROUTING -t nat -s $address -o $defif -j MASQUERADE
iptables -C INPUT -i $dev -j ACCEPT || \
iptables -I INPUT -i $dev -j ACCEPT
iptables -C FORWARD -i $defif -o $dev -j ACCEPT || \
iptables -I FORWARD -i $defif -o $dev -j ACCEPT
iptables -C FORWARD -i $dev -o $defif -j ACCEPT || \
iptables -I FORWARD -i $dev -o $defif -j ACCEPT
iptables -C FORWARD -i $dev -o $dev -j ACCEPT || \
iptables -I FORWARD -i $dev -o $dev -j ACCEPT
iptables -C INPUT -p udp -m udp --dport $port -j ACCEPT || \
iptables -I INPUT -p udp -m udp --dport $port -j ACCEPT

