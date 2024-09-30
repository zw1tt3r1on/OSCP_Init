#!/bin/bash
printf """
 ██████╗ ███████╗ ██████╗██████╗ 
██╔═══██╗██╔════╝██╔════╝██╔══██╗
██║   ██║███████╗██║     ██████╔╝
██║   ██║╚════██║██║     ██╔═══╝ 
╚██████╔╝███████║╚██████╗██║     
 ╚═════╝ ╚══════╝ ╚═════╝╚═╝     
Download and Install Essential Tools for OSCP
Made by zw1tt3r1on
"""                                                     

sudo apt-get update -y
sudo apt install terminator -y
sudo apt install rlwrap -y
sudo apt install python3-wsgidav -y
sudo apt install neo4j -y
sudo apt install bloodhound -y
sudo apt install bloodhound.py -y
sudo apt install feroxbuster -y
sudo apt install remmina -y
pip3 install uploadserver

printf "[+] Downloading Rustscan \n"
wget -q https://github.com/RustScan/RustScan/releases/download/2.3.0/rustscan-2.3.0-x86_64-linux.zip
unzip rustscan-2.3.0-x86_64-linux.zip
mv tmp/rustscan-2.3.0-x86_64-linux/rustscan .
rm rustscan-2.3.0-x86_64-linux.zip
rm -rf tmp

printf "[+] Setting up nmapAutomator \n"
git clone https://github.com/21y4d/nmapAutomator.git
sudo ln -s $(pwd)/nmapAutomator/nmapAutomator.sh /usr/local/bin/

printf "[+] Configure Neo4j while waiting http://localhost:7474 \n"
(&>/dev/null neo4j &)

printf "[+] Downloading Pivoting Tools \n"

wget -q https://github.com/nicocha30/ligolo-ng/releases/download/v0.7.2-alpha/ligolo-ng_proxy_0.7.2-alpha_linux_amd64.tar.gz && [ -f ligolo-ng_proxy_0.7.2-alpha_linux_amd64.tar.gz  ]
tar xvzf ligolo-ng_proxy_0.7.2-alpha_linux_amd64.tar.gz  && [ -f proxy ] && rm -rf LICENSE README.md && rm -rf ligolo-ng_proxy_0.7.2-alpha_linux_amd64.tar.gz

wget -q https://github.com/nicocha30/ligolo-ng/releases/download/v0.7.2-alpha/ligolo-ng_agent_0.7.2-alpha_linux_amd64.tar.gz && [ -f ligolo-ng_agent_0.7.2-alpha_linux_amd64.tar.gz ]
tar xvzf ligolo-ng_agent_0.7.2-alpha_linux_amd64.tar.gz  && [ -f agent ] && rm -rf LICENSE README.md && rm -rf ligolo-ng_agent_0.7.2-alpha_linux_amd64.tar.gz

wget -q https://github.com/nicocha30/ligolo-ng/releases/download/v0.7.2-alpha/ligolo-ng_agent_0.7.2-alpha_windows_amd64.zip && [ -f ligolo-ng_agent_0.7.2-alpha_windows_amd64.zip ]
unzip ligolo-ng_agent_0.7.2-alpha_windows_amd64.zip  && [ -f agent.exe ] && rm -rf LICENSE README.md && rm -rf ligolo-ng_agent_0.7.2-alpha_windows_amd64.zip

printf "[+] Downloading Common Linux Priv Esc Tools \n"

wget -q https://raw.githubusercontent.com/ly4k/PwnKit/main/PwnKit
wget -q https://github.com/peass-ng/PEASS-ng/releases/latest/download/linpeas.sh
wget -q https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64

chmod +x PwnKit
chmod +x linpeas.sh
chmod +x pspy64

printf "[+] Downloading Windows Enum Tools \n"

wget -q https://github.com/peass-ng/PEASS-ng/releases/download/20240901-df0685e9/winPEAS.bat
wget -q https://github.com/peass-ng/PEASS-ng/releases/download/20240901-df0685e9/winPEASx64.exe
wget -q https://github.com/peass-ng/PEASS-ng/releases/download/20240901-df0685e9/winPEASx86.exe
wget -q https://github.com/AlessandroZ/LaZagne/releases/download/v2.4.6/LaZagne.exe

printf "[+] Downloading Common Windows Exploits \n"

wget -q https://gist.githubusercontent.com/netbiosX/a114f8822eb20b115e33db55deee6692/raw/bd61ba9db7af8ffcd57d3dbfa8208b495cdc854d/FodhelperUACBypass.ps1
wget -q https://github.com/BeichenDream/GodPotato/releases/download/V1.20/GodPotato-NET2.exe
wget -q https://github.com/BeichenDream/GodPotato/releases/download/V1.20/GodPotato-NET35.exe
wget -q https://github.com/BeichenDream/GodPotato/releases/download/V1.20/GodPotato-NET4.exe
wget -q https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer64.exe
wget -q https://github.com/itm4n/FullPowers/releases/download/v0.1/FullPowers.exe

printf "[+] Downloading Windows ConPtyShell \n"

wget -q https://raw.githubusercontent.com/antonioCoco/ConPtyShell/master/Invoke-ConPtyShell.ps1

printf "[+] Wordlist Configurations \n"

sudo gunzip /usr/share/wordlists/rockyou.txt.gz
cp /usr/share/wordlists/rockyou.txt .

echo '$!' > end_1_exclam.rule
echo '$1' >> end_1_exclam.rule
cp /usr/share/hashcat/rules/best64.rule .
