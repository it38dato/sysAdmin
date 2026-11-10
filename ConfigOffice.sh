#!/bin/bash 
checkcmd(){
if [ $? -eq 0 ]; then
	echo ! The command was executed successfully
else
	echo ! The command was executed with an error
fi
}
# https://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linux-shell-script
while true; do
    read -p "Do you want to configure the program? (y/n) " yn
    case $yn in
        [Yy]* ) 
			echo -n "Select the distribution where you want to configure the program (Redhat - 1 / Debian - 2): "
			read choicedistr
			case "$choicedistr" in
				1|r|R|Redhat) 
					echo tpassword | sudo -S sudo dnf -y update
					checkcmd
					echo -n "Select a program (Test - 0 / Disabling Lamp - 1 / Starting Lamp - 2 / Add users in postgressql - 3 / Moving linux folders to another disk - 4): "
					read choiceprogr
					case "$choiceprogr" in
						0)
							echo tpassword | sudo -S sudo dnf -y update
							checkcmd
							;;
						1)
							echo tpassword | sudo -S sudo service apache2 stop
							checkcmd
							echo tpassword | sudo -S sudo service mysql stop
							checkcmd
							;;
						2)
							echo tpassword | sudo -S sudo service apache2 start
							checkcmd
							echo tpassword | sudo -S sudo service mysql start
							checkcmd
							;;
						3) #https://www.dmosk.ru/miniinstruktions.php?mini=postgresql-users&ysclid=lig0a2xuou515754413#create
							echo -n "Please come up with a new user: "
							read userdb
							echo -n "Please come up with a new password: "
							read passwdb
							#echo tpassword | sudo -S 
							cd /tmp
							sudo -u postgres -H -- psql -d template1 -c "CREATE USER $userdb WITH PASSWORD '$passwdb';"
							#psql -U postgres -d template1 -c "CREATE USER tuser0 WITH PASSWORD 'Tpsswd';"
							checkcmd
							echo -n "Please come up with a new base: "
							read namedb
							sudo -u postgres -H -- psql -d template1 -c "CREATE database $namedb;"
							checkcmd
							sudo -u postgres -H -- psql -d template1 -c "GRANT ALL PRIVILEGES ON DATABASE "$namedb" to $userdb;"
							checkcmd
							sudo -u postgres -H -- psql -d template1 -c "\c $namedb;"
							checkcmd
							sudo -u postgres -H -- psql -d template1 -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO "$userdb";"
							checkcmd
							;;
						4) #http://sysengineering.ru/notes/peremeschenie-papok-linux-na-drugoy-disk?ysclid=lisfix46x1712981898
							lsblk
							echo -n "USB device for moving the base (hint above): "
							read mntusb
							echo tpassword | sudo -S sudo fdisk $mntusb
							lsblk
							echo -n "USB device for moving the base (hint above): "
							read mntusb1
							echo -n "Enter the file system type: "
							read mntfs
							echo tpassword | sudo -S sudo mkfs -t $mntfs $mntusb1
							checkcmd
							echo tpassword | sudo -S sudo mount $mntusb1 /mnt
							checkcmd
							shopt -s dotglob
							echo -n "Which directory do you need to move: "
							read movedir
							echo tpassword | sudo -S sudo rsync -aulvXpogtr $movedir/* /mnt
							checkcmd
							ls -Zd $movedir
							ls -Zd /mnt
							echo -n "Change the security settings of a new folder (hint above): "
							read mntset
							echo tpassword | sudo -S sudo chcon -t $mntset /mnt
							checkcmd
							ls -Zd /mnt
							echo tpassword | sudo -S sudo umount /mnt
							checkcmd
							echo tpassword | sudo -S sudo blkid
							echo -n "Enter the UUID of the disk (hint above): "
							read mntuid
							echo tpassword | sudo -S sudo sh -c "echo 'UUID=$mntuid   $movedir  $mntfs  defaults,noatime,nofail 0 2' >> /etc/fstab"
							checkcmd
							echo tpassword | sudo -S sudo cat /etc/fstab | grep $mntfs
							echo tpassword | sudo -S sudo mv $movedir $movedir.back
							echo tpassword | sudo -S sudo mkdir $movedir
							echo tpassword | sudo -S sudo mount -av
							checkcmd
							ls $movedir
							lsblk						
							;;
					esac
					;;
				2|d|D|Debian) 
					echo "deb"
					exit 0
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
