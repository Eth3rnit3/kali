FROM kalilinux/kali-rolling

RUN apt -y update && apt -y upgrade && apt -y autoremove && apt clean

RUN apt install -y aircrack-ng crackmapexec \
    net-tools git crunch curl nano whois \
    kali-linux-nethunter \
    wordlists wpscan
# https://www.kali.org/tools/kali-meta

RUN echo "alias scan-range='nmap -T5 -n -sn'" >> /root/.bashrc
RUN echo "alias http-server='python3 -m http.server 8080'" >> /root/.bashrc
RUN echo "alias php-server='php -S 127.0.0.1:8080 -t .'" >> /root/.bashrc
RUN echo "alias ftp-server='python -m pyftpdlib -u \"admin\" -P \"S3cur3d_Ftp_3rv3r\" -p 2121'" >> /root/.bashrc

WORKDIR /root

CMD ["/bin/bash"]