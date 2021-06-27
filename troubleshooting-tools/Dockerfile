FROM alpine:latest
RUN apk add --no-cache darkhttpd tcpdump curl bash iperf3 bind-tools openssh busybox-extras nmap jq\
&& echo 'echo -e "Uasge: \n\ntools included in this toolbox:bash, ssh, ping, traceroute, curl, dig, wget, nslookup, darkhttpd, tcpdump, iperf3, telnet, nmap, dnsd, udhcpd, tftp, ftpd.\
\n\nExample: \n - nslookup www.bing.com \n - traceroute www.bing.com \n - darkhttpd <path> \n - tcpdump -i eth0 -w packet.pcap \n - iperf3 -s\
 \n - iperf3 -c <serverip> \n - wget http://192.168.1.1/1.tar.gz \n - curl -o 1.tar.gz http://192.168.1.1/1.tar.gz \n - dig www.bing.com \n - nmap 192.168.1.1 \n - telnet 192.168.1.1 80 \n "' > /root/.bashrc && echo "dns 192.168.10.1">/etc/dnsd.conf
CMD ["/bin/bash"]