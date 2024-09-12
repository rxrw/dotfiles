#!/bin/bash

# 获取本机的所有 IP 地址
ip_list=$(ifconfig | grep -oE 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -oE '([0-9]*\.){3}[0-9]*')

# 遍历所有 IP 地址，检查是否在 192.168.6.x 段
for ip in $ip_list; do
    if [[ $ip == 192.168.6.* ]]; then
        exit 1  # 是内网，返回 1
    fi
done

exit 0  # 非内网，返回 0

