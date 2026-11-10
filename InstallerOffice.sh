#!/bin/bash
checkcmd(){
if [ $? -eq 0 ]; then
	echo ! The command was executed successfully
else
	echo ! The command was executed with an error
fi
} 
#echo tpassword | sudo -S sudo dnf update
#checkcmd
# https://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linux-shell-script
while true; do
    read -p "Do you want to install the program? (y/n) " yn
    case $yn in
        [Yy]* ) 
			echo -n "Select the distribution where you want to install the program (Centos 9 - 1 / Ubuntu 22.04 - 2 / Redos 7.3 - 3): "
			read choicedistr
			case "$choicedistr" in
				1|Centos) 
					echo tpassword | sudo -S sudo dnf -y update
					checkcmd
					echo -n "Select a program (Test - 0 / Sublime Text - 1 / Postgresql - 2 / PgAdmin - 3 / Git - 4 / Kvm - 5 / nfts-3g - 6 / libreoffice - 7): "
					read choiceprogr
					case "$choiceprogr" in
						0)
							echo tpassword | sudo -S sudo dnf -y update
							checkcmd
							;;
						1)
							# https://www.sublimetext.com/docs/linux_repositories.html#dnf
							echo tpassword | sudo -S sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
							checkcmd
							echo tpassword | sudo -S sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
							checkcmd
							echo tpassword | sudo -S sudo dnf -y install sublime-text
							checkcmd
							;;
						2)
							# https://www.postgresql.org/download/linux/redhat/
							echo tpassword | sudo -S sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm
							checkcmd
							echo tpassword | sudo -S sudo dnf -qy module disable postgresql
							checkcmd
							echo tpassword | sudo -S sudo dnf install -y postgresql15-server
							checkcmd
							echo tpassword | sudo -S sudo /usr/pgsql-15/bin/postgresql-15-setup initdb
							checkcmd
							echo tpassword | sudo -S sudo systemctl enable postgresql-15
							echo tpassword | sudo -S sudo systemctl start postgresql-15
							checkcmd
							;;
						3)
							# https://www.pgadmin.org/download/pgadmin-4-rpm/
							echo tpassword | sudo -S sudo rpm -i https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/pgadmin4-redhat-repo-2-1.noarch.rpm
							checkcmd
							echo tpassword | sudo -S sudo yum install -y pgadmin4
							checkcmd
							echo tpassword | sudo -S sudo yum install -y pgadmin4-desktop
							checkcmd
							echo tpassword | sudo -S sudo yum install -y pgadmin4-web
							checkcmd
							sudo /usr/pgadmin4/bin/setup-web.sh
							checkcmd
							echo tpassword | sudo -S sudo yum upgrade -y pgadmin4
							checkcmd
							;;
						4)
							# https://unixcop.com/how-to-install-git-on-centos-9-stream-fedora/
							echo tpassword | sudo -S sudo dnf -y install git
							checkcmd
							git --version
							;;
						5)
							# https://technixleo.com/install-kvm-on-centos-alma-rhel-9/
							egrep -c '(vmx|svm)' /proc/cpuinfo
							echo tpassword | sudo -S sudo dnf install -y qemu-kvm qemu-img libvirt virt-install libvirt-client virt-manager
							checkcmd
							lsmod | grep kvm
							echo tpassword | sudo -S sudo systemctl enable --now libvirtd
							checkcmd
							sudo virt-host-validate							
							;;
						6)
							# https://itisgood.ru/2019/03/26/kak-smontirovat-disk-ntfs-na-centos-rhel-scientific-linux/
							echo tpassword | sudo -S sudo yum -y install epel-release
							checkcmd
							echo tpassword | sudo -S sudo yum -y install ntfs-3g
							checkcmd			
							;;
						7)
							echo tpassword | sudo -S sudo dnf -y install libreoffice
							checkcmd			
							;;
					esac
					;;
				2|u|U|Ubuntu) 
					echo tpassword | sudo -S sudo apt -y update
					echo tpassword | sudo -S sudo apt -y upgrade
					checkcmd
					echo -n "Select a program (Test - 0 / Net-Tools - 1 / Ssh - 2): "
					read choiceprogr
					case "$choiceprogr" in
						0)
							echo tpassword | sudo -S sudo apt-get -y update
							checkcmd
							;;
						1)
							echo tpassword | sudo -S sudo apt-get install net-tools
							checkcmd
							;;
						2)#https://help.reg.ru/support/servery-vps/oblachnyye-servery/rabota-s-serverom/kak-ustanovit-i-nastroit-ssh
							echo tpassword | sudo -S sudo apt-get install ssh
							checkcmd
							echo tpassword | sudo -S sudo apt-get install openssh-server
							checkcmd
							systemctl status ssh
							;;
					esac
					exit 0
					;;
				3|r|R|Redos)
					echo tpassword | sudo -S sudo yum -y update
					checkcmd
					echo -n "Select a program (Test - 0 / Office - 1 / Playonlinux - 2): "
					read choiceprogr
					case "$choiceprogr" in
						0)
							echo tpassword | sudo -S sudo yum -y update
							checkcmd
							;;						
						1)
							echo tpassword | sudo -S sudo yum -y update
							checkcmd
							wine /LINKS/MS\ Office\ 2007-10-13/Office_Professional_Plus_2007_W32_Russia/SETUP.EXE
							checkcmd	
							;;
						2)
							echo tpassword | sudo -S sudo yum -y update
							checkcmd
							echo tpassword | sudo -S sudo touch /etc/yum.repos.d/playonlinux.repo
							echo tpassword | sudo -S sudo echo '[playonlinux]
							name=PlayOnLinux Official repository
							baseurl=http://rpm.playonlinux.com/fedora/yum/base
							enable=1
							gpgcheck=0
							gpgkey=http://rpm.playonlinux.com/public.gpg' > /etc/yum.repos.d/playonlinux.repo
							cat /etc/yum.repos.d/playonlinux.repo
							checkcmd
							echo tpassword | sudo -S sudo yum -y install playonlinux nc jq
							checkcmd
							echo tpassword | sudo -S sudo reboot							
							;;
					esac
					;;
				*) 
					echo "Nothing was entered."
					;;
			esac			
			;;
        [Nn]* ) 
			exit
			;;
        * ) 
			echo "Please answer yes or no."
			;;
    esac
done
exit 0
