/ip firewall filter
add action=add-src-to-address-list address-list="Port Scanners" address-list-timeout=3d chain=input comment="Port Scanners to list " protocol=tcp psd=21,3s,3,1
add action=add-src-to-address-list address-list="Port Scanners" address-list-timeout=3d chain=input comment="NMAP FIN Stealth scan" protocol=tcp tcp-flags=fin,!syn,!rst,!psh,!ack,!urg
add action=add-src-to-address-list address-list="Port Scanners" address-list-timeout=3d chain=input comment="SYN/FIN scan" protocol=tcp tcp-flags=fin,syn
add action=add-src-to-address-list address-list="Port Scanners" address-list-timeout=3d chain=input comment="SYN/RST scan" protocol=tcp tcp-flags=syn,rst
add action=add-src-to-address-list address-list="Port Scanners" address-list-timeout=3d chain=input comment="FIN/PSH/URG scan" protocol=tcp tcp-flags=fin,psh,urg,!syn,!rst,!ack
add action=add-src-to-address-list address-list="Port Scanners" address-list-timeout=3d chain=input comment="ALL/ALL scan" protocol=tcp tcp-flags=fin,syn,rst,psh,ack,urg
add action=add-src-to-address-list address-list="Port Scanners" address-list-timeout=3d chain=input comment="NMAP NULL scan" protocol=tcp tcp-flags=!fin,!syn,!rst,!psh,!ack,!urg
add action=drop chain=input comment="dropping Port Scanners" src-address-list="Port Scanners"
add action=drop chain=forward comment="Drop Spam" protocol=tcp src-port=25,587,465,110,995
add action=drop chain=forward dst-port=25,587,465,110,995 protocol=tcp
add action=add-src-to-address-list address-list=Sys_Floder address-list-timeout=30m chain=input comment="Syn Flood" connection-limit=30,32 protocol=tcp
add action=drop chain=input src-address-list=Sys_Floder
add action=drop chain=forward comment=Memchache dst-port=11211 protocol=udp
add action=drop chain=forward comment=Memchache protocol=udp src-port=11211
add action=drop chain=forward comment="Drop Exploit" connection-limit=20,32 dst-port=445 protocol=tcp
add action=drop chain=forward connection-limit=20,32 dst-port=2000 protocol=tcp
add action=drop chain=forward comment=Metasploit connection-limit=20,32 dst-port=4444 protocol=tcp
add action=drop chain=forward comment=SMPP connection-limit=20,32 dst-port=444 protocol=tcp
add action=drop chain=input src-address-list="Online-Scanner"
add action=drop chain=forward comment=W32.Erkez dst-port=8181 protocol=tcp
add action=drop chain=forward dst-port=8181 protocol=udp
add action=drop chain=forward comment=W32/Lovsan.A!worm dst-port=135,139,445,539 protocol=tcp
add action=drop chain=forward dst-port=135,137,138,69 protocol=udp
/ip firewall raw
add action=drop chain=prerouting comment="Drop Spam" protocol=tcp src-port=25
add action=drop chain=prerouting dst-port=25 protocol=tcp
add action=drop chain=prerouting comment="Drop Flood" dst-port=53 protocol=udp src-address-list=!Allow-DNS
add action=drop chain=prerouting comment="Drop Exploit" dst-port=445 protocol=tcp
add action=drop chain=prerouting dst-port=2000 protocol=tcp
add action=drop chain=prerouting dst-port=4444 protocol=tcp
add action=drop chain=prerouting dst-port=444 protocol=tcp
add action=drop chain=prerouting dst-port=137-139 protocol=tcp comment="NETBIOS"
add action=drop chain=prerouting dst-port=137-139 protocol=udp comment="NETBIOS"
add action=drop chain=prerouting src-address-list="Online-Scanner"
add action=drop chain=prerouting comment=W32.Erkez dst-port=8181 protocol=tcp
add action=drop chain=forward dst-port=8181 protocol=udp
add action=drop chain=input dst-port=8181 protocol=udp
add action=drop chain=forward comment=W32/Lovsan.A!worm dst-port=135,139,445,539 protocol=tcp
add action=drop chain=forward dst-port=135,137,138,69 protocol=udp
add action=drop chain=forward comment=BOPM dst-port=6667 protocol=tcp
add action=drop chain=forward dst-port=6667 protocol=udp
add action=drop chain=forward protocol=tcp src-port=6667
add action=drop chain=forward protocol=tcp src-port=11111
add action=drop chain=forward dst-port=11111 protocol=tcp
add action=drop chain=forward dst-port=2568 protocol=tcp
add action=drop chain=forward dst-port=2568 protocol=udp
add action=drop chain=forward protocol=tcp src-port=2568
add action=drop chain=forward protocol=udp src-port=2568
/ip firewall address-list 
add address=10.0.0.0/8 list=Allow-DNS
add address=172.16.0.0/12 list=Allow-DNS
add address=192.168.0.0/16 list=Allow-DNS
add address=66.132.159.0/24 list="Online-Scanner" comment=Censys
add address=162.142.125.0/24 list="Online-Scanner" comment=Censys
add address=167.94.138.0/24 list="Online-Scanner" comment=Censys
add address=167.94.145.0/24 list="Online-Scanner" comment=Censys
add address=167.94.146.0/24 list="Online-Scanner" comment=Censys
add address=167.248.133.0/24 list="Online-Scanner" comment=Censys
add address=199.45.154.0/24 list="Online-Scanner" comment=Censys
add address=199.45.155.0/24 list="Online-Scanner" comment=Censys
add address=206.168.34.0/24 list="Online-Scanner" comment=Censys
add address=206.168.35.0/24 list="Online-Scanner" comment=Censys
add address=66.132.148.0/24 list="Online-Scanner" comment=Censys
add address=66.132.153.0/24 list="Online-Scanner" comment=Censys
add address=206.168.32.0/24 list="Online-Scanner" comment=Censys
add address=206.168.33.0/24 list="Online-Scanner" comment=Censys
add address=103.224.80.0/20 list="Online-Scanner" comment=Zoomeye
add address=198.20.69.74 list="Online-Scanner" comment=Shodan
add address=198.20.69.98 list="Online-Scanner" comment=Shodan
add address=198.20.70.114 list="Online-Scanner" comment=Shodan
add address=198.20.99.130 list="Online-Scanner" comment=Shodan
add address=93.120.27.62 list="Online-Scanner" comment=Shodan
add address=66.240.236.119 list="Online-Scanner" comment=Shodan
add address=71.6.135.131 list="Online-Scanner" comment=Shodan
add address=66.240.192.138 list="Online-Scanner" comment=Shodan
add address=71.6.167.142 list="Online-Scanner" comment=Shodan
add address=82.221.105.6 list="Online-Scanner" comment=Shodan
add address=82.221.105.7 list="Online-Scanner" comment=Shodan
add address=71.6.165.200 list="Online-Scanner" comment=Shodan
add address=188.138.9.50 list="Online-Scanner" comment=Shodan
add address=85.25.103.50 list="Online-Scanner" comment=Shodan
add address=85.25.43.94 list="Online-Scanner" comment=Shodan
add address=71.6.146.185 list="Online-Scanner" comment=Shodan
add address=71.6.158.166 list="Online-Scanner" comment=Shodan
add address=198.20.87.98 list="Online-Scanner" comment=Shodan
add address=66.240.219.146 list="Online-Scanner" comment=Shodan
add address=209.126.110.38 list="Online-Scanner" comment=Shodan
add address=104.131.0.69 list="Online-Scanner" comment=Shodan
add address=66.240.219.133 list="Online-Scanner" comment=Shodan
add address=143.198.225.197 list="Online-Scanner" comment=Shodan
add address=137.184.95.216 list="Online-Scanner" comment=Shodan
add address=64.227.90.185 list="Online-Scanner" comment=Shodan
add address=143.198.238.87 list="Online-Scanner" comment=Shodan
add address=137.184.190.205 list="Online-Scanner" comment=Shodan
add address=137.184.112.192 list="Online-Scanner" comment=Shodan
add address=137.184.190.188 list="Online-Scanner" comment=Shodan
add address=167.172.219.157 list="Online-Scanner" comment=Shodan
add address=143.110.239.2 list="Online-Scanner" comment=Shodan
add address=143.198.68.20 list="Online-Scanner" comment=Shodan
add address=137.184.190.194 list="Online-Scanner" comment=Shodan
add address=137.184.190.246 list="Online-Scanner" comment=Shodan
add address=137.184.9.17 list="Online-Scanner" comment=Shodan
add address=137.184.13.100 list="Online-Scanner" comment=Shodan
add address=137.184.94.133 list="Online-Scanner" comment=Shodan
add address=137.184.112.103 list="Online-Scanner" comment=Shodan
add address=137.184.180.190 list="Online-Scanner" comment=Shodan
add address=143.198.50.234 list="Online-Scanner" comment=Shodan
add address=185.142.236.36 list="Online-Scanner" comment=Shodan
add address=185.142.236.40 list="Online-Scanner" comment=Shodan
add address=185.142.236.41 list="Online-Scanner" comment=Shodan
add address=185.142.236.43 list="Online-Scanner" comment=Shodan
add address=185.142.239.16 list="Online-Scanner" comment=Shodan
add address=198.20.69.96/29 list="Online-Scanner" comment=Shodan
add address=198.20.70.112/29 list="Online-Scanner" comment=Shodan
add address=198.20.87.96/29 list="Online-Scanner" comment=Shodan
add address=198.20.99.128/29 list="Online-Scanner" comment=Shodan
add address=66.240.205.34 list="Online-Scanner" comment=Shodan
add address=71.6.146.130 list="Online-Scanner" comment=Shodan
add address=71.6.147.198 list="Online-Scanner" comment=Shodan
add address=71.6.147.254 list="Online-Scanner" comment=Shodan
add address=71.6.150.153 list="Online-Scanner" comment=Shodan
add address=71.6.167.125 list="Online-Scanner" comment=Shodan
add address=89.248.172.7 list="Online-Scanner" comment=Shodan
add address=165.227.62.247 list="Online-Scanner" comment=Shodan
add address=165.227.55.4 list="Online-Scanner" comment=Shodan
add address=216.117.2.180 list="Online-Scanner" comment=Shodan
add address=195.144.21.56 list="Online-Scanner" comment=Shodan
add address=185.165.190.17 list="Online-Scanner" comment=Shodan
add address=98.143.148.107 list="Online-Scanner" comment=Shodan
add address=155.94.254.133 list="Online-Scanner" comment=Shodan
add address=155.94.254.143 list="Online-Scanner" comment=Shodan
add address=155.94.222.12 list="Online-Scanner" comment=Shodan
add address=98.143.148.135 list="Online-Scanner" comment=Shodan
add address=207.90.244.0/24 list="Online-Scanner" comment=Shodan
add address=119.63.192.0/21 list="Online-Scanner" comment=Baidu
add address=119.63.192.0/24 list="Online-Scanner" comment=Baidu
add address=119.63.193.0/24 list="Online-Scanner" comment=Baidu
add address=119.63.194.0/24 list="Online-Scanner" comment=Baidu
add address=119.63.195.0/24 list="Online-Scanner" comment=Baidu
add address=119.63.196.0/24 list="Online-Scanner" comment=Baidu
add address=119.63.197.0/24 list="Online-Scanner" comment=Baidu
add address=119.63.198.0/24 list="Online-Scanner" comment=Baidu
add address=119.63.199.0/24 list="Online-Scanner" comment=Baidu
add address=71.6.233.0/24 list="Online-Scanner" comment=RAPID
add address=5.63.151.96/27 list="Online-Scanner" comment=RAPID
add address=88.202.190.128/27 list="Online-Scanner" comment=RAPID
add address=109.123.117.228 list="Online-Scanner" comment=RAPID
add address=109.123.117.230 list="Online-Scanner" comment=RAPID
add address=109.123.117.232 list="Online-Scanner" comment=RAPID
add address=64.62.197.254 list="Online-Scanner" comment="Shadow-Server"
add address=149.20.4.0/24 list="Online-Scanner" comment="Shadow-Server"
add address=149.20.5.0/24 list="Online-Scanner" comment="Shadow-Server"
add address=149.20.6.0/24 list="Online-Scanner" comment="Shadow-Server"
add address=185.162.235.0/24 list="Online-Scanner" comment=BinaryEdge
add address=185.162.236.0/24 list="Online-Scanner" comment=BinaryEdge
add address=185.162.237.0/24 list="Online-Scanner" comment=BinaryEdge
