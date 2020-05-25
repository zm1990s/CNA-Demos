FROM alpine:latest
RUN apk add --no-cache darkhttpd tcpdump curl bash iperf3 bind-tools openssh\
&& echo 'echo -e "Uasge: \n\ntools included in this toolbox:bash, ssh, ping, traceroute, crul, dig, wget, nslookup, darkhttpd, tcpdump, iperf3.\
\n\nExample: \n - nslookup www.bing.com \n - traceroute www.bing.com \n - darkhttpd <path> \n - tcpdump -i eth0 -w packet.pcap \n - iperf3 -s\
 \n - iperf3 -c <serverip> \n - wget http://192.168.1.1/1.tar.gz \n - curl -o 1.tar.gz http://192.168.1.1/1.tar.gz \n - dig www.bing.com"' > /root/.bashrc
CMD ["/bin/bash"]