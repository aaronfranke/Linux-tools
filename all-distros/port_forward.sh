#!/bin/bash

INTERFACE="wlp2s0"
IP=$(ip addr show wlp2s0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)

add() {
	PROTOCOL="$1"
	PORT="$2"

	echo "Rebinding $PROTOCOL $IP:$PORT..."
	upnpc -d "$PORT" "$PROTOCOL" 2>&1 > /dev/null || echo "Failed to unbind."
	upnpc -a "$IP" "$PORT" "$PORT" "$PROTOCOL" 86400 2>&1 > /dev/null || echo "Failed to rebind."
}

# PORT FORWARDING RULES:

add "TCP" "443"
add "TCP" "25565"
add "UDP" "25565"
