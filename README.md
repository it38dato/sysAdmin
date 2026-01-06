<p>
    <strong>Task:</strong><br>
    В рамках импортозамещения протестировать дистрибутивы Redos и Alt и развернуть их в компьютерные классы.<br>
    <strong>Decision:</strong><br>
    1. Установить Hyper-V в Windows Server 2012 c помощью Shell:<br>
    PS C:\Windows\system32&gt; Get-Module -ListAvailable<br>
    ModuleType Version&nbsp;&nbsp;Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ExportedCo<br>
    ---------- -------&nbsp;&nbsp;----&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;----------<br>
    ...<br>
    Binary&nbsp;&nbsp; 1.1&nbsp;&nbsp;&nbsp;&nbsp;Hyper-V&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {Add-VMDvd<br>
    ...<br>
    PS C:\Windows\system32&gt; Import-Module -Name Hyper-V<br>
    2. Развернуть виртуальную тестовую машину Redos в Hyber-v с помощью Powershell:<br>
    PS C:\Windows\system32&gt; Get-VM<br>
    Name State CPUUsage(%) MemoryAssigned(M) Uptime Status<br>
    ---- ----- ----------- ----------------- ------ ------<br>
    Alt Off 0&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00:00:00 Работает нормально<br>
    PS C:\Windows\system32&gt; $ram=1*1024*1024*1024<br>
    PS C:\Windows\system32&gt; $ram<br>
    1073741824<br>
    PS C:\Windows\system32&gt; $hdd=10*1024*1024*1024<br>
    PS C:\Windows\system32&gt; $hdd<br>
    10737418240<br>
    PS C:\Windows\system32&gt; NEW-VM -Name Redos -MemoryStartupBytes $ram -NewVHDPath 'C:\Data\VM\Redos\Redos.vhdx'-NewVHD<br>
    SizeBytes $hdd -Path 'C:\Data\VM\Redos'<br>
    Name State CPUUsage(%) MemoryAssigned(M) Uptime Status<br>
    ---- ----- ----------- ----------------- ------ ------<br>
    Redos Off 0&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00:00:00 Работает нормально<br>
    PS C:\Windows\system32&gt; Get-VM<br>
    Name State CPUUsage(%) MemoryAssigned(M) Uptime Status<br>
    ---- ----- ----------- ----------------- ------ ------<br>
    Alt Off 0&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00:00:00 Работает нормально<br>
    Redos Off 0&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00:00:00 Работает нормально<br>
    PS C:\Windows\system32&gt; Start-VM -name Redos<br>
    PS C:\Windows\system32&gt; Get-VM<br>
    Name State CPUUsage(%) MemoryAssigned(M) Uptime Status<br>
    ---- ----- ----------- ----------------- ------ ------<br>
    Alt Off&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00:00:00 Работает нормально<br>
    Redos Running 0&nbsp;&nbsp;&nbsp;&nbsp; 1024&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00:00:16 Работает нормально<br>
    PS C:\Windows\system32&gt; Stop-VM Redos<br>
    Подтверждение<br>
    Hyper-V не удается завершить работу виртуальной машины Redos, так как служба интеграции по завершению работы недоступна.<br>
    Во избежание потенциальной потери данных вы можете приостановить виртуальную машину или сохранить ее состояние. Другим<br>
    вариантом является отключение виртуальной машины, но при этом возможна потеря данных.<br>
    [Y] Да - Y [N] Нет - N [S] Приостановить - S [?] Справка (значением по умолчанию является "Y"): y<br>
    PS C:\Windows\system32&gt; Get-VM<br>
    Name State CPUUsage(%) MemoryAssigned(M) Uptime Status<br>
    ---- ----- ----------- ----------------- ------ ------<br>
    Alt Off 0&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00:00:00 Работает нормально<br>
    Redos Off 0&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00:00:00 Работает нормально<br>
    3. Установить и настроить дистрибутив Redos в виртуальной машине.<br>
    - выбираем Install - выбрать размер разделов - поменяем систему разметки LVM на Standart Portition - нажимаем на click here to create them autmaticaly - установщик автоматически разделит диск - уменьшить размер корневого раздела / и раздел /home - Меняю у них размеры - Done - интернет настроить в Network &amp; Host Name - Ethernet переключаем тумблер - Done - software Slection - minmal install- Done - запуск<br>
    4. Установить виртуальный сервер AltLinux в Hyper-V.<br>
    PS C:\Windows\system32&gt; $ram=1*1024*1024*1024<br>
    PS C:\Windows\system32&gt; $ram<br>
    1073741824<br>
    PS C:\Windows\system32&gt; $hdd=10*1024*1024*1024<br>
    PS C:\Windows\system32&gt; $hdd<br>
    10737418240<br>
    PS C:\Windows\system32&gt; NEW-VM -Name Alt -MemoryStartupBytes $ram -NewVHDPath 'C:\Data\VM\Alt\Alt.vhdx'-NewVHD<br>
    SizeBytes $hdd -Path 'C:\Data\VM\Alt'<br>
    PS C:\Windows\system32&gt; Start-VM -name Alt<br>
    PS C:\Windows\system32&gt; Get-VM<br>
    Name State CPUUsage(%) MemoryAssigned(M) Uptime Status<br>
    ---- ----- ----------- ----------------- ------ ------<br>
    Alt Off&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00:00:00 Работает нормально<br>
    5. Ввод компьютера в домен Windows и изменение имени хоста.<br>
    [root@hvredos ~]# yum install join-to-domain<br>
    [root@hvredos ~]# join-to-domain.sh<br>
    [root@hvredos ~]# reboot<br>
    [root@hvredos ~]# hostname hvredos.tdomain.ru<br>
    [root@hvredos ~]# hostname<br>
    hvredos.tdomain.ru<br>
    [root@hvredos ~]# vim /etc/hostname<br>
    [root@hvredos ~]# cat /etc/hostname<br>
    hvredos.tdomain.ru<br>
    [root@hvredos ~]# vim /etc/hosts<br>
    [root@hvredos ~]# cat /etc/hosts<br>
    127.0.0.1 localhost localhost.localdomain localhost4 localhost4.localdomain4<br>
    ::1 localhost localhost.localdomain localhost6 localhost6.localdomain6<br>
    127.0.0.1 hvredos.tdomain.ru hvredos<br>
    6. Установка Консультант Плюс и подключение сетевых директорий с использованием automount и механизма Kerberos.<br>
    - Для подключения скрытых сетевых каталогов необходимо экранировать символ $.<br>
    - В файле /etc/krb5.conf нужно закомментировать строку (если она ещё не закомментирована).<br>
    - Создать ярлык Консультант +. В случае замедленной работы можно добавить ключ /sprocess=0. При нормальной работе, не добавляйте этот ключ. Ключ /yes необходим для подавления сообщения об ошибке [WNetGetUniversalName ...] : NO_NETWORK<br>
    [root@hvredos ~]# yum install wine winetricks<br>
    # winetricks riched30 winhttp<br>
    - Wine - Wine Configuration - Графика - уберите галочку в пункте "Разрешить менеджеру окон декорировать окна". - Для запуска «Консультант Плюс» на рабочей станции подключите сетевой диск с «Консультантом» - Сделать это можно с помощью подключения сетевых директорий с использованием automount и механизма Kerberos<br>
    [root@hvredos ~]# smbclient -L hvredos -k<br>
    Sharename Type Comment<br>
    --------- ---- -------<br>
    Consultant Disk<br>
    ConsultantR Disk<br>
    S Disk<br>
    ...<br>
    [root@hvredos ~]# yum install cifs-utils autofs<br>
    [root@hvredos ~]# klist<br>
    Ticket cache: FILE:/tmp/krb5cc_1<br>
    Default principal: tuser@tdomain.ru<br>
    Valid starting Expires service principal<br>
    31.08.2020 09:51:47 31.08.2020 19:51:47 krbtgt/tdomain.ru@tdomain.ru<br>
    renew until 31.08.2020 19:51:47<br>
    [root@hvredos ~]# vim /etc/auto.master<br>
    [root@hvredos ~]# cat /etc/auto.master<br>
    ...<br>
    /mnt/.hpwindows /etc/auto.samba --ghost<br>
    [root@hvredos ~]# vim /etc/auto.samba<br>
    [root@hvredos ~]# cat /etc/auto.samba<br>
    Students -fstype=cifs,multiuser,cruid=tuser,sec=krb5,domain=tdomain.ru,vers=2.1 ://hpwindows/Students<br>
    [root@hvredos ~]# vim /etc/auto.samba<br>
    [root@hvredos ~]# cat /etc/auto.samba<br>
    Consultant -fstype=cifs,multiuser,cruid=tuser,sec=krb5,domain=tdomain.ru,vers=2.1 ://hpwindows/Consultant\$<br>
    [root@hvredos ~]# cat /etc/krb5.conf<br>
    ...<br>
    default_ccache_name = KEYRING:persistent:%{uid}<br>
    ...<br>
    [root@hvredos ~]# vim/etc/krb5.conf<br>
    [root@hvredos ~]# cat /etc/krb5.conf<br>
    ...<br>
    default_ccache_name = FILE:/tmp/krb5cc_%{uid}<br>
    ...<br>
    [root@hvredos ~]# systemctl start autofs.service<br>
    [root@hvredos ~]# systemctl enable autofs --now<br>
    [root@hvredos ~]# ls /mnt/.hpwindows/Consultant/<br>
    ... cons.exe ...<br>
    [root@hvredos ~]# winecfg<br>
    [root@hvredos ~]# wine /mnt/.hpwindows/Сonsultant/cons.exe /linux /yes<br>
    [root@hvredos ~]# vim /home/tuser@tdomain.ru/Рабочий\ стол/Consultant.desktop<br>
    [root@hvredos ~]# cat /home/tuser@tdomain.ru/Рабочий\ стол/Consultant.desktop<br>
    [Desktop Entry]<br>
    Name=ConsultantPlus<br>
    Exec=wine /mnt/.hpwindows/Сonsultant/cons.exe<br>
    Type=Application<br>
    StartupNotify=true<br>
    Comment=ConsultantPlus<br>
    icon=43D4_Cons.0<br>
    StartupWMClass=c.exe<br>
    7. Создание ярлыка для сетевой директории<br>
    [root@hvredos ~]# ln -s /mnt/.hvredos/S /home/tuser@tdomain.ru/Рабочий\ стол/S<br>
    8. Oграничение доступа к USB накопителям.<br>
    [root@hvredos ~]# vim /etc/udev/rules.d/99-usb.rules<br>
    [root@hvredos ~]# cat /etc/udev/rules.d/99-usb.rules<br>
    ENV{ID_USB_DRIVER}=="usb-storage",ENV{UDISKS_IGNORE}="1"<br>
    # udevadm control --reload-rules<br>
    9. Запрет создания ярлыков и файлов на рабочем столе.<br>
    [root@hvredos ~]# tune2fs -l /dev/sda1 | grep "Default mount options:"<br>
    Default mount options: user_xattr acl<br>
    [root@hvredos ~]# vim /home/tuser@tdomain.ru/.config/user-dirs.dirs<br>
    [root@hvredos ~]# cat /home/tuser@tdomain.ru/.config/user-dirs.dirs<br>
    # This file is written by xdg-user-dirs-update<br>
    # If you want to change or add directories, just edit the line you're<br>
    # interested in. All local changes will be retained on the next run<br>
    # Format is XDG_xxx_DIR="$HOME/yyy", where yyy is a shell-escaped<br>
    # homedir-relative path, or XDG_xxx_DIR="/yyy", where /yyy is an<br>
    # absolute path. No other format is supported.<br>
    #<br>
    XDG_DESKTOP_DIR="$HOME/Рабочий стол"<br>
    XDG_DOWNLOAD_DIR="$HOME/Загрузки"<br>
    XDG_TEMPLATES_DIR="$HOME/Шаблоны"<br>
    XDG_PUBLICSHARE_DIR="$HOME/Общедоступные"<br>
    XDG_DOCUMENTS_DIR="$HOME/Документы"<br>
    XDG_MUSIC_DIR="$HOME/Музыка"<br>
    XDG_PICTURES_DIR="$HOME/Изображения"<br>
    XDG_VIDEOS_DIR="$HOME/Видео"<br>
    [root@hvredos ~]# ls -la /home/tuser@tdomain.ru/.config<br>
    ...<br>
    -rw-------. 1 tuser ïîëüçîâàòåëè äîìåíà 714 àâã 31 09:52 user-dirs.dirs<br>
    -rw-r--r--. 1 tuser ïîëüçîâàòåëè äîìåíà 5 àâã 31 09:52 user-dirs.locale<br>
    [root@hvredos ~]# chown root:root /home/tuser@tdomain.ru/.config/user-dirs.dirs<br>
    [root@hvredos ~]# ls -la /home/tuser@tdomain.ru/.config<br>
    ...<br>
    -rw-------. 1 root root 714 àâã 31 09:52 user-dirs.dirs<br>
    -rw-r--r--. 1 tuser ïîëüçîâàòåëè äîìåíà 5 àâã 31 09:52 user-dirs.locale<br>
    [root@hvredos ~]# ls -la<br>
    ...<br>
    drwxr-xr-x. 2 tuser ïîëüçîâàòåëè äîìåíà 4096 àâã 31 09:52 'Рабочий стол'<br>
    ...<br>
    [root@hvredos ~]# chown -R root:root /home/tuser@tdomain.ru/Рабочий\ стол/<br>
    [root@hvredos ~]# ls -la<br>
    ...<br>
    drwxr-xr-x. 2 root root 4096 àâã 31 09:52 'Рабочий стол'<br>
    drwxr-xr-x. 2 tuser ïîëüçîâàòåëè äîìåíà 4096 àâã 31 09:52 Øàáëîíû<br>
    10. Как скрыть пользователей от экрана входа.<br>
    [root@hvredos ~]# cat /var/lib/AccountsService/users/user<br>
    [User]<br>
    Language=<br>
    XSession=<br>
    SystemAccount=false<br>
    [root@hvredos ~]# vim /var/lib/AccountsService/users/user<br>
    [root@hvredos ~]# cat /var/lib/AccountsService/users/user<br>
    [User]<br>
    Language=<br>
    XSession=gnome<br>
    SystemAccount=true<br>
    11. Добавление пользователя из доменной сети.<br>
    [root@hvredos ~]# vim /var/lib/AccountsService/users/user<br>
    [root@hvredos ~]# cat /var/lib/AccountsService/users/user<br>
    [User]<br>
    Language=<br>
    XSession=<br>
    Icon=/home/tuser@tdomain.ru/.face<br>
    SystemAccount=false<br>
    12. Отключить сетевые принтеры.<br>
    [root@hvredos ~]# vim /etc/avahi/avahi-daemon.conf<br>
    cat /etc/avahi/avahi-daemon.conf<br>
    # This file is part of avahi.<br>
    ...<br>
    enable-dbus=no<br>
    ...<br>
    [root@hvredos ~]# reboot<br>
    13. &nbsp;Настройка оповещения и автоматического обновления пакетов в РЕД ОС с помощью yum-cron.<br>
    - Если не требуется обновлять определенные пакеты (как вручную, так и автоматически), то добавляем их в исключение. Например, kernel и php.<br>
    - Если не требуется обновлять пакеты ТОЛЬКО в автоматическом режиме, тогда в /etc/yum/yum-cron.conf , в раздел [base]<br>
    [root@hvredos ~]# yum -y install yum-cron<br>
    [root@hvredos ~]# vim /etc/yum/yum-cron.conf<br>
    [root@hvredos ~]# cat /etc/yum/yum-cron.conf<br>
    [commands]<br>
    ...<br>
    apply_updates = no<br>
    [root@hvredos ~]# vim /etc/yum/yum-cron.conf<br>
    [root@hvredos ~]# cat /etc/yum/yum-cron.conf<br>
    [commands]<br>
    ...<br>
    apply_updates = yes<br>
    [root@hvredos ~]# systemctl enable yum-cron --now<br>
    [root@hvredos ~]# nano /etc/yum.conf<br>
    exclude=kernel, php<br>
    [root@hvredos ~]# nano /etc/yum/yum-cron.conf<br>
    exclude=kernel* php*<br>
    14. Развернуть Pxe сервер для развертывания Redos с загрузкой в Uefi по сети.<br>
    [root@hvredos ~]# ifconfig<br>
    enp2s0: flags=4163&lt;UP,BROADCAST,RUNNING,MULTICAST&gt; mtu 1500<br>
    inet tipwindowsserver netmask Mask1 broadcast IpAddr.255<br>
    ...<br>
    [root@hvredos ~]# dnf install dhcp tftp-server syslinux httpd dnf-plugins-core -y<br>
    [root@hvredos ~]# mkdir /var/lib/tftpboot/pxelinux.cfg<br>
    [root@hvredos ~]# mkdir /var/lib/tftpboot/uefi<br>
    [root@hvredos ~]# mkdir -p /var/lib/tftpboot/images/REDOS<br>
    [root@hvredos ~]# cp /usr/share/syslinux/{chain.c32,mboot.c32,memdisk,menu.c32,pxelinux.0,ldlinux.c32,libutil.c32} /var/lib/tftpboot/<br>
    [root@hvredos ~]# chmod 777 /var/lib/tftpboot/pxelinux.0<br>
    [root@hvredos ~]# dnf download shim-x64 grub2-efi-x64 --downloaddir=/root/<br>
    [root@hvredos ~]# cd /root/<br>
    [root@hvredos ~]# rpm2cpio shim-x64-*.rpm | cpio -dimv<br>
    [root@hvredos ~]# rpm2cpio grub2-efi-x64-*.rpm | cpio -dimv<br>
    [root@hvredos ~]# cp ./boot/efi/EFI/BOOT/BOOTX64.EFI /var/lib/tftpboot/uefi<br>
    [root@hvredos ~]# cp ./boot/efi/EFI/redos/grubx64.efi /var/lib/tftpboot/uefi<br>
    [root@hvredos ~]# chmod 777 /var/lib/tftpboot/uefi/*.*<br>
    [root@hvredos ~]# umount -t iso9660 -o loop redos-MUROM-7.3.2-20211027.0-Everything-x86_64-DVD1.iso /mnt/<br>
    [root@hvredos ~]# cp -vR /mnt/* /var/lib/tftpboot/images/REDOS/<br>
    [root@hvredos ~]# umount /mnt/<br>
    [root@hvredos ~]# vim /etc/dhcp/dhcpd.conf<br>
    [root@hvredos ~]# cat /etc/dhcp/dhcpd.conf<br>
    non-authoritative;<br>
    allow bootp;<br>
    option space pxelinux;<br>
    option pxelinux.magic code 208 = string;<br>
    option pxelinux.configfile code 209 = text;<br>
    option pxelinux.pathprefix code 210 = text;<br>
    option pxelinux.reboottime code 211 = unsigned integer 32;<br>
    option architecture-type code 93 = unsigned integer 16;<br>
    subnet tipwindowsserver.0 netmask Mask1 {<br>
    option routers tipwindowsserver;<br>
    range tipwindowsserver.70 tipwindowsserver.80;<br>
    class "pxeclients" {<br>
    match if substring (option vendor-class-identifier, 0, 9) = "PXEClient";<br>
    next-server tipwindowsserver;<br>
    if option architecture-type = 00:07 {<br>
    filename "uefi/grubx64.efi";<br>
    }<br>
    else {<br>
    filename "pxelinux.0";<br>
    }<br>
    }<br>
    }<br>
    # systemctl enable dhcpd --now<br>
    [root@hvredos ~]# vim /var/lib/tftpboot/pxelinux.cfg/default<br>
    [root@hvredos ~]# cat /var/lib/tftpboot/pxelinux.cfg/default<br>
    default menu.c32<br>
    PROMPT 0<br>
    TIMEOUT 150<br>
    MENU TITLE PXE Menu<br>
    LABEL REDOS 7.3<br>
    MENU LABEL REDOS 7.3<br>
    KERNEL images/REDOS/images/pxeboot/vmlinuz<br>
    APPEND initrd=images/REDOS/images/pxeboot/initrd.img ramdisk_size=128000 ip=dhcp inst.repo=http://tipwindowsserver/images/REDOS/<br>
    [root@hvredos ~]# vim /var/lib/tftpboot/uefi/grub.cfg<br>
    [root@hvredos ~]# cat /var/lib/tftpboot/uefi/grub.cfg<br>
    function load_video {<br>
    insmod efi_gop<br>
    insmod efi_uga<br>
    insmod video_bochs<br>
    insmod video_cirrus<br>
    insmod all_video<br>
    }<br>
    load_video<br>
    set gfxpayload=keep<br>
    insmod gzio<br>
    menuentry 'REDOS 7.3' {<br>
    linux images/REDOS/images/pxeboot/vmlinuz ip=dhcp inst.repo=http://tipwindowsserver/images/REDOS/<br>
    initrd images/REDOS/images/pxeboot/initrd.img<br>
    }<br>
    15. Используем web-сервер для публикации файлов дистрибутива РЕД ОС в локальной сети.<br>
    [root@hvredos ~]# vim /etc/httpd/conf.d/pxeboot.conf<br>
    [root@hvredos ~]# cat /etc/httpd/conf.d/pxeboot.conf<br>
    Alias /images /var/lib/tftpboot/images<br>
    &lt;Directory /var/lib/tftpboot/images&gt;<br>
    Options Indexes FollowSymLinks<br>
    Require ip 127.0.0.1 tipwindowsserver.0/24<br>
    &lt;/Directory&gt;<br>
    [root@hvredos ~]# systemctl enable httpd --now<br>
    16. Настройка и запуск службы tftp.<br>
    [root@hvredos ~]# vim /usr/lib/systemd/system/tftp.service<br>
    [root@hvredos ~]# cat /usr/lib/systemd/system/tftp.service<br>
    ...<br>
    [Install]:<br>
    WantedBy=multi-user.target<br>
    Also=tftp.socket<br>
    ...<br>
    [root@hvredos ~]# vim /usr/lib/systemd/system/tftp.socket<br>
    [root@hvredos ~]# cat /usr/lib/systemd/system/tftp.socket<br>
    ...<br>
    [Unit]<br>
    Description=Tftp Server Activation Socket<br>
    [Socket]<br>
    ListenDatagram=0.0.0.0:69<br>
    [Install]<br>
    WantedBy=sockets.target<br>
    ...<br>
    [root@hvredos ~]# systemctl daemon-reload<br>
    [root@hvredos ~]# systemctl enable tftp --now<br>
    [root@hvredos ~]# ausearch -c 'httpd' --raw | audit2allow -M my-httpd<br>
    [root@hvredos ~]# semodule -i my-httpd.pp<br>
    17. Автоматизация развертывания (kickstart)<br>
    Создать файл kickstart, Записать файл на локальный или удаленный носитель, Создать загрузочный диск, с которого будет запускаться установка, Предоставить доступ к установочной структуре, Начать процесс установки.<br>
    [root@hvredos ~]# dnf install pykickstart -y<br>
    [root@hvredos ~]# cp /root/anaconda-ks.cfg /var/lib/tftpboot<br>
    [root@hvredos ~]# mv /var/lib/tftpboot/anaconda-ks.cfg /var/lib/tftpboot/ks.cfg<br>
    [root@hvredos ~]# vim /var/lib/tftpboot/pxelinux.cfg/default<br>
    [root@hvredos ~]# cat /var/lib/tftpboot/pxelinux.cfg/default<br>
    ...<br>
    APPEND initrd=images/REDOS/images/pxeboot/initrd.img ramdisk_size=128000 ip=dhcp method=http://tipwindowsserver/images/REDOS/ devfs=nomount inst.ks=http://tipwindowsserver/ks.cfg<br>
    [root@hvredos ~]# vim /var/lib/tftpboot/uefi/grub.cfg<br>
    [root@hvredos ~]# cat /var/lib/tftpboot/uefi/grub.cfg<br>
    ... {<br>
    linux images/REDOS/images/pxeboot/vmlinuz ip=dhcp kernel vmlinuz inst.repo=http://tipwindowsserver/images/REDOS/ inst.ks=http://tipwindowsserver/ks.cfg<br>
    initrd images/REDOS/images/pxeboot/initrd.img<br>
    }<br>
    [root@hvredos ~]# vim /var/lib/tftpboot/ks.cfg<br>
    [root@hvredos ~]# cat /var/lib/tftpboot/ks.cfg<br>
    # Здесь указываем раскладку клавиатуры<br>
    keyboard --vckeymap=us --xlayouts='us','ru' --switch='grp:alt_shift_toggle'<br>
    # Системная локаль<br>
    lang ru_RU.UTF-8<br>
    # Информация о сетевом интерфейсе и имя машины<br>
    network --bootproto=dhcp --device=enp2s0 --noipv6 --activate<br>
    network --hostname=hostname1337<br>
    # Пароль Root представлен в виде хэш-суммы<br>
    rootpw --iscrypted $6$DUu0yyOYMRbGS8gL$9zHYPsxROGEZdDKG0wnf7h8SGnKOp3V272De6oGTVUsz2uBLmEeiR6T6cInRN5dyWcxNXh5fVluEUTQ/3rmzB0<br>
    # Настройка сервисов (в данном случае сервис по обновлению меток времени и дат)<br>
    services --enabled="chronyd"<br>
    # Настройка временной зоны<br>
    timezone Europe/Moscow --isUtc<br>
    #Настройка локального пользователя<br>
    user --groups=wheel --name=mekka --password=$6$83fyYZ7KMS7G9t6A$E5/99/ffOwjUOo8THr1ngqGDdKMimpTZf3IT9S/SI98BTV7dta7GksLYnQEZjtqqyZQrwibSRlvYccRqHB7m8/ --iscrypted --gecos="Mekka"<br>
    # Настройка xorg при загрузке<br>
    xconfig --startxonboot<br>
    # Указание загрузочного сектора и тип структуры<br>
    bootloader --location=mbr --boot-drive=sda<br>
    # Удаление всей информации с партиций для последующей установки<br>
    clearpart --none --initlabel<br>
    # Здесь указана вся разметка диска<br>
    part /boot --fstype="xfs" --onpart=sda2<br>
    part biosboot --fstype="biosboot" --noformat --onpart=sda4<br>
    part pv.31 --fstype="lvmpv" --noformat --onpart=sda3<br>
    part /boot/efi --fstype="efi" --onpart=sda1 --fsoptions="umask=0077,shortname=winnt"<br>
    volgroup ro --noformat --useexisting<br>
    logvol swap --fstype="swap" --useexisting --name=swap --vgname=ro<br>
    logvol /home --fstype="xfs" --noformat --useexisting --name=home --vgname=ro<br>
    logvol / --fstype="ext4" --useexisting --name=root --vgname=ro<br>
    #дополнительные пакеты для установки<br>
    %packages<br>
    @^mate-desktop-environment<br>
    @backup-client<br>
    @base<br>
    @branding<br>
    @core<br>
    @desktop-debugging<br>
    @dial-up<br>
    @directory-client<br>
    @fonts<br>
    @guest-agents<br>
    @guest-desktop-agents<br>
    @input-methods<br>
    @internet-applications<br>
    @internet-browser<br>
    @java-platform<br>
    @mate-desktop<br>
    @multimedia<br>
    @network-file-system-client<br>
    @print-client<br>
    @x11<br>
    chrony<br>
    %end<br>
    #настройка аварийных дампов памяти в случае сбоев (оставить как есть)<br>
    %addon com_redhat_kdump --enable --reserve-mb='auto'<br>
    %end<br>
    #настройка анаконды (оставить как есть)<br>
    %anaconda<br>
    pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty<br>
    pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok<br>
    pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty<br>
    %end<br>
    18. Настройка установки РЕД ОС по PXE через VNC вместо Kickstart.<br>
    [root@hvredos ~]# vim /var/lib/tftpboot/pxelinux.cfg/default<br>
    [root@hvredos ~]# cat /var/lib/tftpboot/pxelinux.cfg/default<br>
    ...<br>
    APPEND initrd=images/REDOS/images/pxeboot/initrd.img ramdisk_size=128000 ip=dhcp method=http://tipwindowsserver/images/REDOS/ devfs=nomount inst.vnc inst.vncpassword=tpassword<br>
    [root@hvredos ~]# vim /var/lib/tftpboot/uefi/grub.cfg<br>
    [root@hvredos ~]# cat /var/lib/tftpboot/uefi/grub.cfg<br>
    ... {<br>
    linux images/REDOS/images/pxeboot/vmlinuz ip=dhcp kernel vmlinuz inst.repo=http://tipwindowsserver/images/REDOS/ inst.vnc inst.vncpassword=tpassword<br>
    initrd images/REDOS/images/pxeboot/initrd.img<br>
    }<br>
    19. Set up an ActiveDirectory/Login.<br>
    root@hvalt:~# apt-get install task-auth-ad-sssd<br>
    root@hvalt:~# net time set -S tdomain.ru<br>
    # system-auth write ad tdomain.ru hvalt hvalt 'tuser' 'tpassword'<br>
    Using short domain name -- hvalt<br>
    Joined 'hvalt' to dns domain 'tdomain.ru'<br>
    Successfully registered hostname with DNS<br>
    failed to call wbcGetDisplayName: WBC_ERR_WINBIND_NOT_AVAILABLE<br>
    Could not lookup sid S-1-5-21-965402400-3010625364-1855727791-513<br>
    failed to call wbcGetDisplayName: WBC_ERR_WINBIND_NOT_AVAILABLE<br>
    Could not lookup sid S-1-5-21-965402400-3010625364-1855727791-512<br>
    root@hvalt:~# wbinfo -t<br>
    checking the trust secret for domain hvredos via RPC calls succeeded<br>
    root@hvalt:~# acc<br>
    2 keyboards found<br>
    qt.qpa.xcb: could not connect to display<br>
    qt.qpa.plugin: Could not load the Qt platfohvredos plugin "xcb" in "" even though it was found.<br>
    This applhvredosation failed to start because no Qt platfohvredos plugin could be initialized. Reinstalling the applhvredosation may fix this problem.<br>
    Available platfohvredos plugins are: eglfs, linuxfb, minimal, minimalegl, offscreen, vnc, xcb.<br>
    root@hvalt:~# exit<br>
    root@hvalt:~# exit<br>
    [root@hvredos ~]# ssh -X tuser@hvalt<br>
    root@hvalt:~# su -<br>
    root@hvalt:~# acc<br>
    2 keyboards found<br>
    QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to '/tmp/.private/root/runtime-root'<br>
    libpng warning: hvredosCP: known incorrect sRGB profile<br>
    libpng warning: hvredosCP: known incorrect sRGB profile<br>
    libpng warning: hvredosCP: known incorrect sRGB profile<br>
    libpng warning: hvredosCP: known incorrect sRGB profile<br>
    libpng warning: hvredosCP: known incorrect sRGB profile<br>
    WARNING: (alterator lookout evaluation): imported module (alterator presentation events) overrides core binding `when'<br>
    libpng warning: hvredosCP: known incorrect sRGB profile<br>
    libpng warning: hvredosCP: known incorrect sRGB profile<br>
    libpng warning: hvredosCP: known incorrect sRGB profile<br>
    libpng warning: hvredosCP: known incorrect sRGB profile<br>
    root@hvalt:~# vim /etc/net/ifaces/eth0/resolv.conf<br>
    root@hvalt:~# cat /etc/net/ifaces/eth0/resolv.conf<br>
    nameserver tipwindowsserver<br>
    root@hvalt:~# hostnamectl set-hostname hvalt.tdomain.ru<br>
    root@hvalt:~# cat /etc/resolv.conf<br>
    search tdomain.ru<br>
    nameserver 127.0.0.1<br>
    root@hvalt:~# vim /etc/resolv.conf<br>
    root@hvalt:~# cat /etc/resolv.conf<br>
    # Configuration for resolv(8)<br>
    # See resolv.conf(5) for details<br>
    resolv_conf_head='# Do not edit manually, use\n# /etc/net/ifaces/&lt;interface&gt;/resolv.conf instead.'<br>
    resolv_conf=/etc/resolv.conf<br>
    # These interfaces will always be processed first.<br>
    interface_order='lo lo[0-9]* lo.*'<br>
    # These interfaces will be processed next, unless they have a metrhvredos.<br>
    dynamhvredos_order='tap[0-9]* tun[0-9]* vpn vpn[0-9]* wg[0-9]* ppp[0-9]* ippp[0-9]*'<br>
    #Configuration files for named subscriber.<br>
    named_zones=/var/lib/bind/etc/resolv-zones.conf<br>
    named_options=/var/lib/bind/etc/resolv-options.conf<br>
    #Configuration files for dnsmasq subscriber.<br>
    dnsmasq_conf=/etc/dnsmasq.conf.d/60-resolv<br>
    dnsmasq_resolv=/etc/resolv.conf.dnsmasq<br>
    name_servers=127.0.0.1<br>
    root@hvalt:~# vim /etc/resolv.conf<br>
    root@hvalt:~# cat /etc/resolv.conf<br>
    # Configuration for resolv(8)<br>
    # See resolv.conf(5) for details<br>
    resolv_conf_head='# Do not edit manually, use\n# /etc/net/ifaces/&lt;interface&gt;/resolv.conf instead.'<br>
    resolv_conf=/etc/resolv.conf<br>
    # These interfaces will always be processed first.<br>
    #interface_order='lo lo[0-9]* lo.*'<br>
    interface_order='lo lo[0-9]* lo.* eth0'<br>
    search_domains=tdomain.ru<br>
    # These interfaces will be processed next, unless they have a metrhvredos.<br>
    dynamhvredos_order='tap[0-9]* tun[0-9]* vpn vpn[0-9]* wg[0-9]* ppp[0-9]* ippp[0-9]*'<br>
    #Configuration files for named subscriber.<br>
    named_zones=/var/lib/bind/etc/resolv-zones.conf<br>
    named_options=/var/lib/bind/etc/resolv-options.conf<br>
    #Configuration files for dnsmasq subscriber.<br>
    dnsmasq_conf=/etc/dnsmasq.conf.d/60-resolv<br>
    dnsmasq_resolv=/etc/resolv.conf.dnsmasq<br>
    #name_servers=127.0.0.1<br>
    root@hvalt:~# resolv -u<br>
    root@hvalt:~# cat /etc/resolv.conf<br>
    # Generated by resolv<br>
    # Do not edit manually, use<br>
    # /etc/net/ifaces/&lt;interface&gt;/resolv.conf instead.<br>
    search tdomain.ru<br>
    nameserver tipwindowsserver<br>
    ...<br>
    nameserver 8.8.8.8<br>
    root@hvalt:~# hostname<br>
    hvalt.tdomain.ru<br>
    root@hvalt:~# dig _kerberos._udp.tdomain.ru SRV | grep ^_kerberos<br>
    _kerberos._udp.tdomain.ru. 600 IN SRV 0 100 88 M-1.tdomain.ru.<br>
    ...<br>
    _kerberos._udp.tdomain.ru. 600 IN SRV 0 100 88 T-1.tdomain.ru.<br>
    root@hvalt:~# dig _kerberos._tcp.tdomain.ru SRV | grep ^_kerberos<br>
    _kerberos._tcp.tdomain.ru. 600 IN SRV 0 100 88 M-c.tdomain.ru.<br>
    ...<br>
    _kerberos._tcp.tdomain.ru. 600 IN SRV 0 100 88 T-1.tdomain.ru.<br>
    root@hvalt:~# cat /etc/krb5.conf | grep default_realm<br>
    default_realm = tdomain.ru<br>
    # default_realm = EXAMPLE.COM<br>
    root@hvalt:~# cat /etc/krb5.conf | grep dns_lookup_realm<br>
    dns_lookup_realm = false<br>
    root@hvalt:~# cat /etc/krb5.conf | grep dns_lookup_kdc<br>
    dns_lookup_kdc = true<br>
    root@hvalt:~# exit<br>
    [root@hvredos ~]# ssh -X tuser@hvalt<br>
    root@hvalt:~# kinit tuser<br>
    root@hvalt:~# klist<br>
    Thvredosket cache: KEYRING:persistent:0:krb_ccache_CCjHpN1<br>
    Default principal: a-r@tdomain.ru<br>
    Valid starting Expires&nbsp;&nbsp; Servhvredose principal<br>
    10.08.2022 12:30:34 10.08.2022 22:30:34 krbtgt/tdomain.ru@tdomain.ru<br>
    renew until 17.08.2022 12:30:32<br>
    root@hvalt:~# apt-get install samba-client<br>
    root@hvalt:~# cat /etc/samba/smb.conf | grep realm<br>
    realm = tdomain.ru<br>
    root@hvalt:~# cat /etc/samba/smb.conf | grep workgroup<br>
    workgroup = hvalt<br>
    root@hvalt:~# cat /etc/samba/smb.conf | grep netbios<br>
    netbios name = hvalt<br>
    root@hvalt:~# cat /etc/samba/smb.conf | grep security<br>
    security = ads<br>
    root@hvalt:~# cat /etc/samba/smb.conf | grep method<br>
    kerberos method = system keytab<br>
    root@hvalt:~# cat /etc/samba/smb.conf | grep idmap<br>
    &nbsp;&nbsp;idmap config * : range = 200000-2000200000<br>
    &nbsp;&nbsp;idmap config * : backend = sss<br>
    root@hvalt:~# vim /etc/samba/smb.conf<br>
    root@hvalt:~# cat /etc/samba/smb.conf | grep idmap<br>
    &nbsp;&nbsp;idmap config * : range = 200000-2000200000<br>
    ;&nbsp;&nbsp;idmap config * : backend = sss<br>
    idmap config * : backend = tdb<br>
    # testpahvalt<br>
    Load smb config files from /etc/samba/smb.conf<br>
    Loaded servhvredoses file OK.<br>
    Weak crypto is allowed<br>
    Server role: ROLE_DOMAIN_MEMBER<br>
    Press enter to see a dump of your servhvredose definitions<br>
    # Global parameters<br>
    [global]<br>
    kerberos method = system keytab<br>
    machine password timeout = 0<br>
    realm = tdomain.ru<br>
    security = ADS<br>
    template homedir = /home/tdomain.ru/%U<br>
    template shell = /bin/bash<br>
    winbind use default domain = Yes<br>
    workgroup = hvredos<br>
    idmap config * : range = 200000-2000200000<br>
    idmap config * : backend = tdb<br>
    [share]<br>
    comment = Commonplace<br>
    path = /srv/share<br>
    read only = No<br>
    [homes]<br>
    browseable = No<br>
    comment = Home Directory for '%u'<br>
    read only = No<br>
    root@hvalt:~# cat /etc/hosts<br>
    127.0.0.1 localhost.localdomain localhost<br>
    root@hvalt:~# vim /etc/hosts<br>
    root@hvalt:~# cat /etc/hosts<br>
    127.0.0.1 hvalt.tdomain.ru hvalt<br>
    root@hvalt:~# net ads join -U tuser<br>
    Enter tuser's password:<br>
    Using short domain name -- hvalt<br>
    Joined 'hvalt' to dns domain 'tdomain.ru'<br>
    root@hvalt:~# klist -k -e<br>
    Keytab name: FILE:/etc/krb5.keytab<br>
    KVNO Principal<br>
    ---- --------------------------------------------------------------------------<br>
    9 host/hvalt.tdomain.ru@tdomain.ru (aes256-cts-hmac-sha1-96)<br>
    9 host/hvalt@tdomain.ru (aes256-cts-hmac-sha1-96)<br>
    9 host/hvalt.tdomain.ru@tdomain.ru (aes128-cts-hmac-sha1-96)<br>
    9 host/hvalt@tdomain.ru (aes128-cts-hmac-sha1-96)<br>
    9 host/hvalt.tdomain.ru@tdomain.ru (DEPRECATED:arcfour-hmac)<br>
    9 host/hvalt@tdomain.ru (DEPRECATED:arcfour-hmac)<br>
    9 hvalt$@tdomain.ru (aes256-cts-hmac-sha1-96)<br>
    9 hvalt$@tdomain.ru (aes128-cts-hmac-sha1-96)<br>
    9 hvalt$@tdomain.ru (DEPRECATED:arcfour-hmac)<br>
    8 host/hvalt.tdomain.ru@tdomain.ru (aes256-cts-hmac-sha1-96)<br>
    8 host/hvalt@tdomain.ru (aes256-cts-hmac-sha1-96)<br>
    8 host/hvalt.tdomain.ru@tdomain.ru (aes128-cts-hmac-sha1-96)<br>
    8 host/hvalt@tdomain.ru (aes128-cts-hmac-sha1-96)<br>
    8 host/hvalt.tdomain.ru@tdomain.ru (DEPRECATED:arcfour-hmac)<br>
    8 host/hvalt@tdomain.ru (DEPRECATED:arcfour-hmac)<br>
    8 hvalt$@tdomain.ru (aes256-cts-hmac-sha1-96)<br>
    8 hvalt$@tdomain.ru (aes128-cts-hmac-sha1-96)<br>
    8 hvalt$@tdomain.ru (DEPRECATED:arcfour-hmac)<br>
    root@hvalt:~# apt-get install sssd-ad<br>
    root@hvalt:~# cat /etc/sssd/sssd.conf<br>
    [sssd]<br>
    config_file_version = 2<br>
    servhvredoses = nss, pam<br>
    # Managed by system facility command:<br>
    ## control sssd-drop-privileges unprivileged|privileged|default<br>
    user = _sssd<br>
    # SSSD will not start if you do not configure any domains.<br>
    domains = tdomain.ru<br>
    [nss]<br>
    [pam]<br>
    [domain/tdomain.ru]<br>
    id_provider = ad<br>
    auth_provider = ad<br>
    chpass_provider = ad<br>
    access_provider = ad<br>
    default_shell = /bin/bash<br>
    fallback_homedir = /home/%d/%u<br>
    debug_level = 0<br>
    ; cache_credentials = false<br>
    ad_gpo_ignore_unreadable = true<br>
    ad_gpo_access_control = pehvredosissive<br>
    ad_update_samba_machine_account_password = true<br>
    root@hvalt:~# vim /etc/sssd/sssd.conf<br>
    root@hvalt:~# cat /etc/sssd/sssd.conf<br>
    [sssd]<br>
    config_file_version = 2<br>
    servhvredoses = nss, pam<br>
    # Managed by system facility command:<br>
    ## control sssd-drop-privileges unprivileged|privileged|default<br>
    #user = _sssd<br>
    user=root<br>
    # SSSD will not start if you do not configure any domains.<br>
    domains = tdomain.ru<br>
    [nss]<br>
    [pam]<br>
    [domain/tdomain.ru]<br>
    id_provider = ad<br>
    auth_provider = ad<br>
    chpass_provider = ad<br>
    access_provider = ad<br>
    ;ldap_id_mapping = False<br>
    default_shell = /bin/bash<br>
    fallback_homedir = /home/%d/%u<br>
    debug_level = 0<br>
    ;use_fully_qualified_names = True<br>
    ; cache_credentials = True<br>
    ad_gpo_ignore_unreadable = true<br>
    ad_gpo_access_control = pehvredosissive<br>
    ad_update_samba_machine_account_password = true<br>
    root@hvalt:~# grep sss /etc/nsswitch.conf<br>
    passwd: files sss<br>
    shadow: tcb files sss<br>
    group: files [SUCCESS=merge] sss role<br>
    root@hvalt:~# control system-auth sss<br>
    root@hvalt:~# servhvredose sssd status<br>
    active<br>
    root@hvalt:~# servhvredose sssd start<br>
    root@hvalt:~# getent passwd tuser<br>
    tuser:*:1-9:1-3:в-н:/home/tdomain.ru/tuser:/bin/bash<br>
    root@hvalt:~# id tuser<br>
    uid=1-9(tuser) gid=1-3(пользователи домена) группы=1-3(пользователи домена),1-8(администраторы dhcp),1-0(tuser),11-0(пользователи филиалы),1-1(tuser),1-9(i-n)<br>
    root@hvalt:~# net ads info<br>
    LDAP server: IpAddr2<br>
    LDAP server name: MOW-1.tdomain.ru<br>
    Realm: tdomain.ru<br>
    Bind Path: dc=hvalt,dc=RU<br>
    LDAP port: 389<br>
    Server time: Ср, 10 авг 2022 13:08:06 +08<br>
    KDC server: IpAddr2<br>
    Server time offset: 0<br>
    Last machine account password change: Ср, 10 авг 2022 12:50:51 +08<br>
    root@hvalt:~# net ads testjoin<br>
    Join is OK<br>
    root@hvalt:~# cat /etc/lightdm/lightdm.conf | grep greeter-hide-<br>
    # greeter-hide-users = True to hide the user list<br>
    #greeter-hide-users=false<br>
    greeter-hide-users = true<br>
    root@hvalt:~# cat /etc/lightdm/lightdm-gtk-greeter.conf | grep show-language<br>
    show-language-selector = false<br>
    root@hvalt:~# cat /etc/lightdm/lightdm-gtk-greeter.conf | grep show-indhvredosators<br>
    root@hvalt:~# vim /etc/lightdm/lightdm-gtk-greeter.conf<br>
    root@hvalt:~# cat /etc/lightdm/lightdm-gtk-greeter.conf | grep show-indhvredosators<br>
    show-indhvredosators=~a11y;~power;~session;~language<br>
    root@hvalt:~# vim /etc/lightdm/lightdm-gtk-greeter.conf<br>
    root@hvalt:~# cat /etc/lightdm/lightdm-gtk-greeter.conf | grep enter-<br>
    enter-username = true<br>
    root@hvalt:~# reboot<br>
    20. Учетные записи и групп в Альт Линукс.<br>
    root@hvalt:~# apt-get install libnss-role<br>
    root@hvalt:~# groupadd -r localadmins<br>
    groupadd: группа «localadmins» уже существует<br>
    root@hvalt:~# groupadd -r remote<br>
    groupadd: группа «remote» уже существует<br>
    root@hvalt:~# control sshd-allow-groups enabled<br>
    root@hvalt:~# sed -i 's/AllowGroups.*/AllowGroups = remote/' /etc/openssh/sshd_config<br>
    root@hvalt:~# roleadd users cdwriter cdrom audio proc radio camera floppy xgrp scanner uucp fuse<br>
    root@hvalt:~# roleadd localadmins wheel remote vboxusers<br>
    root@hvalt:~# roleadd 'Domain Users' users<br>
    Error 156: No such group<br>
    root@hvalt:~# roleadd 'Пользователи домена' users<br>
    root@hvalt:~# roleadd 'Администраторы домена' localadmins<br>
    root@hvalt:~# rolelst<br>
    users:cdwriter,cdrom,audio,proc,radio,camera,floppy,xgrp,scanner,uucp,fuse,video,vboxusers,vboxadd<br>
    localadmins:wheel,remote,vboxusers,vboxadd<br>
    пользователи домена:users<br>
    администраторы домена:localadmins<br>
    powerusers:remote,vboxadd,vboxusers<br>
    vboxadd:vboxsf<br>
    root@hvalt:~# id tuser<br>
    uid=1-9(tuser) gid=1-3(пользователи домена) группы=1-3(пользователи домена),11-0(пользователи филиалы),1-9(i-n),1-0(tuser),1-1(tuser),1-8(администраторы dhcp),100(users),80(cdwriter),22(cdrom),81(audio),19(proc),83(radio),440(camera),71(floppy),466(xgrp),467(scanner),14(uucp),483(fuse),488(video),481(vboxusers),455(vboxadd),454(vboxsf)<br>
    root@hvalt:~# roleadd 'tuser' localadmins<br>
    root@hvalt:~# roleadd 'tuser' wheel<br>
    root@hvalt:~# rolelst<br>
    users:cdwriter,cdrom,audio,proc,radio,camera,floppy,xgrp,scanner,uucp,fuse,video,vboxusers,vboxadd<br>
    localadmins:wheel,remote,vboxusers,vboxadd<br>
    пользователи домена:users<br>
    администраторы домена:localadmins<br>
    tuser:localadmins<br>
    powerusers:remote,vboxadd,vboxusers<br>
    vboxadd:vboxsf<br>
    root@hvalt:~# exit<br>
    [root@hvredos ~]# ssh -X tuser@hvalt<br>
    root@hvalt:~# id tuser<br>
    uid=1-9(tuser) gid=1-3(пользователи домена) группы=1-3(пользователи домена),11-0(пользователи филиалы),1-9(i-n),1-0(tuser),1-1(tuser),1-8(администраторы dhcp),100(users),80(cdwriter),22(cdrom),81(audio),19(proc),83(radio),440(camera),71(floppy),466(xgrp),467(scanner),14(uucp),483(fuse),488(video),481(vboxusers),455(vboxadd),454(vboxsf),101(localadmins),10(wheel),110(remote)<br>
    21. Добавить сетевые папки.<br>
    root@hvalt:~# apt-get install autofs<br>
    root@hvalt:~# vim /etc/auto.master<br>
    root@hvalt:~# cat /etc/auto.master<br>
    # Fohvredosat of this file:<br>
    # mountpoint map options<br>
    # For details of the fohvredosat look at autofs(8).<br>
    /mnt/auto /etc/auto.tab -t 5<br>
    /mnt/net /etc/auto.avahi -t 120<br>
    /mnt/.tdirectory /etc/auto.samba --ghost<br>
    root@hvalt:~# vim /etc/auto.samba<br>
    root@hvalt:~# cat /etc/auto.samba<br>
    s -fstype=cifs,multiuser,cruid=$USER,sec=krb5,domain=tdomain.ru,vers=1.0 ://hvalt/tdirectory1<br>
    o -fstype=cifs,multiuser,cruid=$USER,sec=krb5,domain=tdomain.ru,vers=1.0 ://hvalt/tdirectory2<br>
    root@hvalt:~# systemctl enable autofs<br>
    root@hvalt:~# systemctl start autofs<br>
    root@hvalt:~# ls -la /mnt/.tdirectory/<br>
    drwxr-xr-x 4 root root 0 авг 11 14:09 .<br>
    drwxr-xr-x 5 root root 4096 авг 11 14:09 ..<br>
    d????????? ? ? ? ?&nbsp;&nbsp; ? o<br>
    d????????? ? ? ? ?&nbsp;&nbsp; ? s<br>
    22. Creating a Network Bridge interface.<br>
    root@hvalt:~# mkdir /etc/net/ifaces/tethernet1<br>
    root@hvalt:~# cp /etc/net/ifaces/tethernet/* /etc/net/ifaces/tethernet1<br>
    root@hvalt:~# rm -f /etc/net/ifaces/tethernet/{i,r}*<br>
    root@hvalt:~# ls /etc/net/ifaces/tethernet1/<br>
    ipv4address options resolv.conf<br>
    root@hvalt:~# cat /etc/net/ifaces/tethernet1/options<br>
    BOOTPROTO=dhcp<br>
    TYPE=eth<br>
    NM_CONTROLLED=yes<br>
    DISABLED=yes<br>
    CONFIG_WIRELESS=no<br>
    SYSTEMD_BOOTPROTO=dhcp4<br>
    CONFIG_IPV4=yes<br>
    SYSTEMD_CONTROLLED=no<br>
    root@hvalt:~# vim /etc/net/ifaces/tethernet1/options<br>
    root@hvalt:~# ls /etc/net/ifaces/<br>
    default tethernet lo unknown tethernet1<br>
    root@hvalt:~# vim /etc/net/ifaces/tethernet1/options<br>
    root@hvalt:~# cat /etc/net/ifaces/tethernet1/options<br>
    BOOTPROTO=static<br>
    CONFIG_WIRELESS=no<br>
    CONFIG_IPV4=yes<br>
    HOST='tethernet'<br>
    ONBOOT=yes<br>
    TYPE=bri<br>
    root@hvalt:~# ls /etc/net/ifaces/tethernet/<br>
    ipv4address options resolv.conf<br>
    root@hvalt:~# service network restart<br>
    <strong>Source:</strong><br>
    # <a href="https://www.altlinux.org/ActiveDirectory/Login#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0_%D0%BF%D0%B0%D0%BA%D0%B5%D1%82%D0%BE%D0%B2">https://www.altlinux.org/ActiveDirectory/Login#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0_%D0%BF%D0%B0%D0%BA%D0%B5%D1%82%D0%BE%D0%B2</a><br>
    # <a href="https://www.altlinux.org/SSSD/AD">https://www.altlinux.org/SSSD/AD</a><br>
    # <a href="https://www.altlinux.org/%D0%A1%D0%B5%D1%82%D0%B5%D0%B2%D0%BE%D0%B9_%D0%BC%D0%BE%D1%81%D1%82">https://www.altlinux.org/%D0%A1%D0%B5%D1%82%D0%B5%D0%B2%D0%BE%D0%B9_%D0%BC%D0%BE%D1%81%D1%82</a><br>
    # <a href="https://www.altlinux.org/PostgreSQL#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0_%D0%B8_%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9_%D0%B7%D0%B0%D0%BF%D1%83%D1%81%D0%BA">https://www.altlinux.org/PostgreSQL#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0_%D0%B8_%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9_%D0%B7%D0%B0%D0%BF%D1%83%D1%81%D0%BA</a><br>
    # <a href="https://www.tecmint.com/install-postgresql-and-pgadmin-in-ubuntu/">https://www.tecmint.com/install-postgresql-and-pgadmin-in-ubuntu/</a><br>
    # <a href="https://o7planning.org/11353/install-pgadmin-on-ubuntu">https://o7planning.org/11353/install-pgadmin-on-ubuntu</a><br>
    # <a href="https://redos.red-soft.ru/base/server-configuring/dbms/install-postgresql/?sphrase_id=53348">https://redos.red-soft.ru/base/server-configuring/dbms/install-postgresql/?sphrase_id=53348</a><br>
    # <a href="https://redos.red-soft.ru/base/server-configuring/dbms/pgadmin4/">https://redos.red-soft.ru/base/server-configuring/dbms/pgadmin4/</a>
</p>
<p>
    <strong>Task:</strong><br>
    В компьютерном классе по 20 компьютеров и в каждом надо было установить Microsoft Office.<br>
    Для этого я написал скрипты инсталлятор и конфигуратор, которые позволяют мне выбрать дистрибутив, в котором я устанавливаю, саму программу для установки и настройки (не только офис).<br>
    <strong>Decision:</strong><br>
    [root@hvredos ~]# ./InstallerOffice.sh<br>
    Do you want to install the program? (y/n) y<br>
    Select the distribution where you want to install the program (Centos 9 - 1 / Ubuntu 22.04 - 2 / Redos 7.3 - 3): 1<br>
    Select a program (Test - 0 / Sublime Text - 1 / Postgresql - 2 / PgAdmin - 3 / Git - 4 / Kvm - 5 / nfts-3g - 6 / libreoffice - 7): 0<br>
    Do you want to install the program? (y/n) y<br>
    Select the distribution where you want to install the program (Centos 9 - 1 / Ubuntu 22.04 - 2 / Redos 7.3 - 3): 2<br>
    Select a program (Test - 0 / Net-Tools - 1 / Ssh - 2): 0<br>
    [root@hvredos ~]# ./ConfigOffice.sh<br>
    Do you want to configure the program? (y/n) y<br>
    Select the distribution where you want to configure the program (Redhat - 1 / Debian - 2): 1<br>
    Select a program (Test - 0 / Disabling Lamp - 1 / Starting Lamp - 2 / Add users in postgressql - 3 / Moving linux folders to another disk - 4): 0<br>
    Do you want to configure the program? (y/n) n<br>
    <strong>Source:</strong><br>
    # <a href="https://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linux-shell-script">https://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linux-shell-script</a>
</p>
<p>
    <strong>Task:</strong><br>
    Столкнулся с такой проблемой, что маленький неттоп флешки не читает, он не был добавлен в домен и антивирус на нем не стоял.<br>
    Убедимся на другой машине, в моем случае ноутбуке, что флешка спокойно видит на нем файлы.<br>
    То есть это чистая флешка, не зараженная, и попробуем ее вставить в тот проблемный неттоп.<br>
    Тут мы увидим, что во флешке другая информация будет.<br>
    Как будто в самой флешке отображается сама флешка, и если ее открыть (что делать не стоит) тот там и будут наши файлы.<br>
    на самом деле они будут зашифрованны и флешка заражена.<br>
    <strong>Decision:</strong><br>
    - антивирус Касперский FREE - рекомендации по устранении проблм в компьютере - устранить - перезагрузиться -<br>
    - антивирус Касперский FREE - информация об устранении проблем<br>
    - вставить флешку - антвирус удалил какой-то файл (это и есть вирус)<br>
    - Открываем флешку после удаления вируса (пустой файл, хотя система показывает, что флешка заполнена, Он содержит зашифрованные файлы)<br>
    - восстановить зашифрованные файлы - Вставьте скрипт FlashDriveRecovery во флешку
</p>
<p>
    <strong>Task:</strong><br>
    Разработать БД инвентарцизация, &nbsp;в котором будет хранится информация о технике в здании<br>
    <strong>Decision:</strong><br>
    В папке projects\inventoryDb хранится проект по работе с БД<br>
    1. Установка и настройка базы данных в PostgreSQL.<br>
    root@hvalt:~# apt-get update<br>
    root@hvalt:~# apt-get install postgresql12-server<br>
    root@hvalt:~# /etc/init.d/postgresql initdb<br>
    root@hvalt:~# systemctl start postgresql<br>
    root@hvalt:~# systemctl enable postgresql<br>
    root@hvalt:~# pg_isready<br>
    root@hvalt:~# psql -U postgres<br>
    postgres=# CREATE USER tuser WITH PASSWORD 'tpassword';<br>
    postgres=# CREATE DATABASE tbase;<br>
    postgres=# GRANT ALL PRIVILEGES ON DATABASE tbase to tuser;<br>
    postgres=# psql -U postgres -c "\l+"<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Список баз данных<br>
    &nbsp;&nbsp; Имя&nbsp;&nbsp; | Владелец | Кодировка | LC_COLLATE | LC_CTYPE |&nbsp;&nbsp; Права доступа&nbsp;&nbsp; | Размер | Табл. пространство |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Опис<br>
    ание&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
    -------------+----------+-----------+-------------+-------------+-----------------------+---------+--------------------+----------------------<br>
    ----------------------<br>
    tbase | postgres | UTF8&nbsp;&nbsp; | ru_RU.UTF-8 | ru_RU.UTF-8 | =Tc/postgres&nbsp;&nbsp;&nbsp;&nbsp; +| 8041 kB | pg_default&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | postgres=CTc/postgres+|&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | tuser=CTc/postgres&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<br>
    postgres&nbsp;&nbsp;| postgres | UTF8&nbsp;&nbsp; | ru_RU.UTF-8 | ru_RU.UTF-8 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 8185 kB | pg_default&nbsp;&nbsp;&nbsp;&nbsp; | default administrativ<br>
    e connection database<br>
    ...<br>
    postgres=# \c tbase<br>
    tbase=# GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO "tuser";<br>
    tbase=# ALTER DATABASE tbase OWNER TO tuser;<br>
    tbase=# \q<br>
    root@kvmubuntu:~# apt install postgresql postgresql-contrib<br>
    root@kvmubuntu:~# usermod -aG postgres tuser<br>
    root@kvmubuntu:~# sudo -i -u postgres<br>
    postgres@kvmubuntu:~$ psql<br>
    postgres=# \q<br>
    postgres@kvmubuntu:~$ createuser --interactive<br>
    Enter name of role to add: tuser<br>
    Shall the new role be a superuser? (y/n) y<br>
    postgres@kvmubuntu:~$ createdb tbase<br>
    postgres@kvmubuntu:~$ exit<br>
    root@kvmubuntu:~# psql -U tuser -d tbase<br>
    tbase=# \password<br>
    tbase=# GRANT ALL PRIVILEGES ON DATABASE tbase to tuser;<br>
    tbase=# GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO "tuser";<br>
    tbase=# ALTER DATABASE tbase OWNER TO tuser;<br>
    tbase=# GRANT pg_read_all_settings TO tuser;<br>
    tbase=# \conninfo<br>
    You are connected to database "tbase" as user "tuser" via socket in "/var/run/postgresql" at port "5432".<br>
    tbase=# \l+<br>
    &nbsp;&nbsp;&nbsp;&nbsp; List of databases<br>
    Name | Owner | Encoding | Collate | Ctype | Access privileges | Size | Tablespace | Description<br>
    -----------+----------+----------+-------------+-------------+-----------------------+---------+------------+--------------------------------------------<br>
    tbase | tuser | UTF8 | en_US.UTF-8 | en_US.UTF-8 | =Tc/tuser +| 8561 kB | pg_default |<br>
    | | | | | tuser=CTc/tuser | | |<br>
    ...<br>
    tbase=# SHOW config_file;<br>
    ...<br>
    /etc/postgresql/14/main/postgresql.conf<br>
    tbase=# \q<br>
    root@kvmubuntu:~# vim /etc/postgresql/14/main/postgresql.conf<br>
    root@kvmubuntu:~# cat /etc/postgresql/14/main/postgresql.conf | grep listen_addresses<br>
    listen_addresses = 'tipubuntu' # what IP address(es) to listen on;<br>
    root@kvmubuntu:~# vim /etc/postgresql/14/main/pg_hba.conf<br>
    root@kvmubuntu:~# cat /etc/postgresql/14/main/pg_hba.conf<br>
    ...<br>
    # "local" is for Unix domain socket connections only<br>
    host tbase tuser tipubuntu/32 md5<br>
    local all all&nbsp;&nbsp; peer<br>
    root@kvmubuntu:~# systemctl restart postgresql<br>
    tuser@kvmubuntu:~$ psql -U tuser -d tbase -h tipubuntu<br>
    tbase=# \d<br>
    Did not find any relations.<br>
    tbase=# \q<br>
    2. Сделаем так, чтобы с клиентской машины Redos мы могли подключаться к серверу AltLinux удаленно.<br>
    root@hvalt:~# su - postgres -c "psql -c 'SHOW config_file;'"<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config_file&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
    -------------------------------------<br>
    /var/lib/pgsql/data/postgresql.conf<br>
    (1 строка)<br>
    # echo "listen_addresses = 'IpAddr3, IpAddr2, hvalt'" &gt;&gt; /var/lib/pgsql/data/postgresql.conf<br>
    [root@hvredos ~]# cat /var/lib/pgsql/data/pg_hba.conf<br>
    ...<br>
    # "local" is for Unix domain socket connections only<br>
    local all&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trust<br>
    # IPv4 local connections:<br>
    host&nbsp;&nbsp;all&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 127.0.0.1/32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;trust<br>
    ...<br>
    [root@hvredos ~]# vim /var/lib/pgsql/data/pg_hba.conf<br>
    [root@hvredos ~]# cat /var/lib/pgsql/data/pg_hba.conf | grep '10.38.'<br>
    # "local" is for Unix domain socket connections only<br>
    local all&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trust<br>
    # IPv4 local connections:<br>
    host&nbsp;&nbsp;tbase&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tuser&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IpAddr2/21&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; md5<br>
    host&nbsp;&nbsp;all&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 127.0.0.1/32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;trust<br>
    root@hvalt:~# systemctl restart postgresql<br>
    root@hvalt:~# systemctl status postgresql<br>
    [root@hvredos ~]# psql -d tbase -U tuser -h hvalt<br>
    3. Для работы с базой в графическом интерфейсе установим Pgadmin.<br>
    root@hvalt:~# apt-get install pgadmin3<br>
    root@hvalt:~# pgadmin3 &amp;<br>
    - add server - name - tuser - host - hvalt- password - tpassword - ok<br>
    [root@hvredos ~]# dnf install postgresql-server<br>
    root@hvalt:~# postgresql-setup initdb<br>
    root@hvalt:~# systemctl enable postgresql<br>
    root@hvalt:~# systemctl start postgresql<br>
    root@hvalt:~# pg_isready<br>
    [root@hvredos ~]# psql -d tbase -U tuser -h hvalt<br>
    tbase=&gt; \du<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Список ролей<br>
    Имя роли |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Атрибуты&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Член ролей<br>
    ----------+-------------------------------------------------------------------------+------------<br>
    tuser |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | {}<br>
    postgres | Суперпользователь, Создаёт роли, Создаёт БД, Репликация, Пропускать RLS | {}<br>
    [root@hvredos ~]# dnf install pgadmin4 pgadmin4-qt<br>
    [root@hvredos ~]# pgadmin4-qt &amp;<br>
    - root's password - add server - name - tuser - host - hvalt- password - tpassword - ok<br>
    4. Создать таблицы.&nbsp;<br>
    - В первой таблице отметим в каких зданиях находятся кабинеты.<br>
    - Вторая таблица отвечает за названия оборудований.<br>
    - Третья таблица отвечает за инвентарные номера оборудований, кабинетов и даты изменения.<br>
    tbase=&gt; SELECT * FROM offices;<br>
    +====+========+===============+<br>
    | id | office | building |<br>
    +====+========+===============+<br>
    | 1 | 1 | Улица1&nbsp;&nbsp;|<br>
    +----+--------+---------------+<br>
    | 2 | 2 | Улица1&nbsp;&nbsp;|<br>
    +----+--------+---------------+<br>
    ...<br>
    +----+--------+---------------+<br>
    | 8 | 8 | Улица2&nbsp;&nbsp;|<br>
    +----+--------+---------------+<br>
    | 9 | 9 | Улица2&nbsp;&nbsp;|<br>
    +----+--------+---------------+<br>
    tbase=&gt; SELECT * FROM devices;<br>
    +====+=================================================+======================================+<br>
    | id | device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | title&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<br>
    +====+=================================================+======================================+<br>
    | 1 | Atc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Panasonic kx-tda100ru&nbsp;&nbsp;&nbsp;&nbsp;|<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 2 | Bидеокамера белая&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | (null)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    ...<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 39 | Усилитель мощности&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Eurosound xz-400&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 40 | 8 port video splitter&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | (null)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    tbase=&gt; SELECT * FROM inventories;<br>
    +====+=============+===========+===========+==========+=====================+<br>
    | id | inventory | device_id | office_id | quantity | date&nbsp;&nbsp;&nbsp;&nbsp;|<br>
    +====+=============+===========+===========+==========+=====================+<br>
    | 1 | 457&nbsp;&nbsp; | 1&nbsp;&nbsp; | 1&nbsp;&nbsp; | 1&nbsp;&nbsp;| 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 2 | (null) | 2&nbsp;&nbsp; | 1&nbsp;&nbsp; | 1&nbsp;&nbsp;| 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    ...<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 67 | 556&nbsp;&nbsp; | 33&nbsp;&nbsp;| 9&nbsp;&nbsp; | 1&nbsp;&nbsp;| 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 68 | 426&nbsp;&nbsp; | 32&nbsp;&nbsp;| 9&nbsp;&nbsp; | 1&nbsp;&nbsp;| 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    5. Мне нужно вывести информацию, где в первом столбце будет инвентарные номера, во втором столбце, устройство и его название, а в третьем столбце вывести кабинеты, где находятся те самые оборудования<br>
    tbase=&gt; SELECT inventory, device, title, office<br>
    FROM inventories<br>
    INNER JOIN devices<br>
    ON inventories.device_id = devices.id<br>
    INNER JOIN offices<br>
    ON inventories.office_id = offices.id<br>
    WHERE office_id='6';<br>
    +=============+=========================+=================+========+<br>
    | inventory | device&nbsp;&nbsp;&nbsp;&nbsp; | title&nbsp;&nbsp; | office |<br>
    +=============+=========================+=================+========+<br>
    | 008&nbsp;&nbsp; | Колонки&nbsp;&nbsp;&nbsp;&nbsp; | Sven sps-605 | 6 |<br>
    +-------------+-------------------------+-----------------+--------+<br>
    | 707&nbsp;&nbsp; | Мультимедийный проектор | Epson eb-965h | 6 |<br>
    +-------------+-------------------------+-----------------+--------+<br>
    | 750&nbsp;&nbsp; | Компьютер&nbsp;&nbsp; | Nuc mini pc kit | 6 |<br>
    +-------------+-------------------------+-----------------+--------+<br>
    6. Заметил ошибку в таблице, есть лишнее оборудование в кабинете. его на самом деле нету в кабинете и значит не должно быть в таблице.<br>
    tbase=&gt; DELETE FROM inventories<br>
    WHERE id='64';<br>
    SELECT inventory, device, title, office<br>
    FROM inventories<br>
    INNER JOIN devices<br>
    ON inventories.device_id = devices.id<br>
    INNER JOIN offices<br>
    ON inventories.office_id = offices.id<br>
    WHERE office_id='6';<br>
    +===========+=========================+=================+========+<br>
    | inventory | device&nbsp;&nbsp;&nbsp;&nbsp; | title&nbsp;&nbsp; | office |<br>
    +===========+=========================+=================+========+<br>
    | 707 | Мультимедийный проектор | Epson eb-965h | 6 |<br>
    +-----------+-------------------------+-----------------+--------+<br>
    | 750 | Компьютер&nbsp;&nbsp; | Nuc mini pc kit | 6 |<br>
    +-----------+-------------------------+-----------------+--------+<br>
    tbase=&gt; SELECT * FROM inventories;<br>
    +====+=============+===========+===========+==========+=====================+<br>
    | id | inventory | device_id | office_id | quantity | date&nbsp;&nbsp;&nbsp;&nbsp;|<br>
    +====+=============+===========+===========+==========+=====================+<br>
    | 1 | 457&nbsp;&nbsp; | 1&nbsp;&nbsp; | 1&nbsp;&nbsp; | 1&nbsp;&nbsp;| 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 2 | (null) | 2&nbsp;&nbsp; | 1&nbsp;&nbsp; | 1&nbsp;&nbsp;| 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    ...<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 67 | 556&nbsp;&nbsp; | 33&nbsp;&nbsp;| 9&nbsp;&nbsp; | 1&nbsp;&nbsp;| 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 68 | 426&nbsp;&nbsp; | 32&nbsp;&nbsp;| 9&nbsp;&nbsp; | 1&nbsp;&nbsp;| 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    7. Появилось новое обрудование, и нужно его внести в таблицу.<br>
    tbase=&gt; INSERT INTO inventories (inventory, device_id, office_id, quantity, date)<br>
    VALUES ('testinv1', '39', '1', '1', '2017-12-12 12:12:12');<br>
    tbase=&gt; SELECT * FROM inventories;<br>
    +====+=============+===========+===========+==========+=====================+<br>
    | id | inventory | device_id | office_id | quantity | date&nbsp;&nbsp;&nbsp;&nbsp;|<br>
    +====+=============+===========+===========+==========+=====================+<br>
    | 1 | 457&nbsp;&nbsp; | 1&nbsp;&nbsp; | 1&nbsp;&nbsp; | 1&nbsp;&nbsp;| 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 2 | (null) | 2&nbsp;&nbsp; | 1&nbsp;&nbsp; | 1&nbsp;&nbsp;| 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    ...<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 68 | 426&nbsp;&nbsp; | 32&nbsp;&nbsp;| 9&nbsp;&nbsp; | 1&nbsp;&nbsp;| 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 69 | testinv1 | 39&nbsp;&nbsp;| 1&nbsp;&nbsp; | 1&nbsp;&nbsp;| 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    8. в предыдущей задаче не верные данные внес в таблицу, нужно подкорректировать.<br>
    tbase=&gt; UPDATE inventories<br>
    SET inventory='testinv2', office_id='9'<br>
    WHERE id='69';<br>
    tbase=&gt; SELECT * FROM inventories;<br>
    +====+=============+===========+===========+==========+=====================+<br>
    | id | inventory | device_id | office_id | quantity | date&nbsp;&nbsp;&nbsp;&nbsp;|<br>
    +====+=============+===========+===========+==========+=====================+<br>
    | 1 | 457&nbsp;&nbsp; | 1&nbsp;&nbsp; | 1&nbsp;&nbsp; | 1&nbsp;&nbsp;| 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 2 | (null) | 2&nbsp;&nbsp; | 1&nbsp;&nbsp; | 1&nbsp;&nbsp;| 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    ...<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 68 | 426&nbsp;&nbsp; | 32&nbsp;&nbsp;| 9&nbsp;&nbsp; | 1&nbsp;&nbsp;| 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 69 | testinv2 | 39&nbsp;&nbsp;| 9&nbsp;&nbsp; | 1&nbsp;&nbsp;| 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    tbase=&gt; SELECT inventory, device, title, office<br>
    FROM inventories<br>
    INNER JOIN devices<br>
    ON inventories.device_id = devices.id<br>
    INNER JOIN offices<br>
    ON inventories.office_id = offices.id<br>
    WHERE office_id='9';<br>
    +=============+==========================+==================+========+<br>
    | inventory | device&nbsp;&nbsp;&nbsp;&nbsp; | title&nbsp;&nbsp; | office |<br>
    +=============+==========================+==================+========+<br>
    | 650&nbsp;&nbsp; | Компьютер&nbsp;&nbsp;&nbsp;&nbsp;| Nuc&nbsp;&nbsp; | 9 |<br>
    +-------------+--------------------------+------------------+--------+<br>
    | 426&nbsp;&nbsp; | Интерактиная доска | 80&nbsp;&nbsp; | 9 |<br>
    +-------------+--------------------------+------------------+--------+<br>
    | 556&nbsp;&nbsp; | Короткофокусный проектор | Benq&nbsp;&nbsp; | 9 |<br>
    +-------------+--------------------------+------------------+--------+<br>
    | 010&nbsp;&nbsp; | Колонки&nbsp;&nbsp;&nbsp;&nbsp; | Microlab solo 1 | 9 |<br>
    +-------------+--------------------------+------------------+--------+<br>
    | testinv2 | Усилитель мощности | Eurosound xz-400 | 9 |<br>
    +-------------+--------------------------+------------------+--------+<br>
    <strong>Source:</strong><br>
    # https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-22-04-quickstart - How To Install PostgreSQL on Ubuntu 22.04 [Quickstart].<br>
    # https://uchet-jkh.ru/i/kak-izmenit-parol-k-baze-dannyx-postgresql/ - Измените пароль для выбранного пользователя.<br>
    # https://asvignesh.in/how-to-get-the-postgresql-conf-file-location/ - Grant Role to the non-default user.<br>
    # https://postgrespro.ru/docs/postgresql/9.5/manage-ag-createdb - Создание базы данных.
</p>
<p>
    <strong>Task:</strong><br>
    Для защиты выпускной экзаменационной работы по теме "Утилита для сканирования безопасности сети Nmap" подготовить несколько тестовых виртуальных машин ОС, настроить Vsftpd-сервер, Nginx-сервер, Proxy-сервер, просканировать виртуальные машины и настроить Iptables<br>
    <strong>Decision:</strong><br>
    1. Выводим список текущих правил iptables и проанализируем какие порты открыты в сервере Centos.<br>
    ┌──(tuser㉿kvmkali)-[~]<br>
    └─$ nmap tipcentos<br>
    [root@kvmcentos ~]# yum install iptables-services<br>
    [root@kvmcentos ~]# iptables --version<br>
    [root@kvmcentos ~]# iptables -L -v<br>
    Chain INPUT (policy ACCEPT 0 packets, 0 bytes)<br>
    pkts bytes target prot opt in out source destination<br>
    Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)<br>
    pkts bytes target prot opt in out source destination<br>
    Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)<br>
    pkts bytes target prot opt in out source destination<br>
    [root@kvmcentos ~]# systemctl start iptables<br>
    [root@kvmcentos ~]# systemctl enable iptables<br>
    [root@kvmcentos ~]# service iptables status<br>
    ┌──(tuser㉿kvmkali)-[~]<br>
    └─$ nmap tipcentos<br>
    ...<br>
    PORT STATE SERVICE<br>
    22/tcp open ssh<br>
    2. В сервере Centos Напишем набор правил iptables, в котором мы разрешаем все исходящие соединения и строго ограничиваем входящие.<br>
    Доступ будет возможен по портам TCP: 21, 22, 25, 53, 80, 143, 443, по портам UDP: 20, 21, 53, также мы пропускаем пакеты для уже установленных соединений.<br>
    С удаленной машины просканируем порты на нашем сервере.<br>
    [root@kvmcentos ~]# chmod +x firewall.sh<br>
    [root@kvmcentos ~]# ./firewall.sh<br>
    [root@kvmcentos ~]# iptables -L -v<br>
    Chain INPUT (policy DROP 1986 packets, 87384 bytes)<br>
    pkts bytes target prot opt in out source destination<br>
    0 0 ACCEPT all -- lo any anywhere anywhere<br>
    79 5604 ACCEPT all -- any any anywhere anywhere state RELATED,ESTABLISHED<br>
    9 396 ACCEPT tcp -- any any anywhere anywhere multiport dports ftp,ssh,smtp,domain,http,imap,https<br>
    0 0 ACCEPT udp -- any any anywhere anywhere multiport dports domain,ftp,ftp-data<br>
    0 0 ACCEPT icmp -- any any anywhere anywhere icmp echo-reply<br>
    Chain FORWARD (policy DROP 0 packets, 0 bytes)<br>
    pkts bytes target prot opt in out source destination<br>
    Chain OUTPUT (policy DROP 0 packets, 0 bytes)<br>
    pkts bytes target prot opt in out source destination<br>
    0 0 ACCEPT all -- any lo anywhere anywhere<br>
    60 7920 ACCEPT all -- any any anywhere anywhere state NEW,RELATED,ESTABLISHED<br>
    [root@kvmcentos ~]# service iptables save<br>
    ┌──(tuser㉿kvmkali)-[~]<br>
    └─$ nmap tipcentos<br>
    ...<br>
    PORT STATE SERVICE<br>
    21/tcp closed ftp<br>
    22/tcp open ssh<br>
    25/tcp closed smtp<br>
    53/tcp closed domain<br>
    80/tcp closed http<br>
    143/tcp closed imap<br>
    443/tcp closed https<br>
    ...<br>
    3. Обнаружим активные устройства в сети.<br>
    ┌──(tuser㉿kvmkali)-[~]<br>
    └─$ apt install nmap<br>
    ┌──(tuser㉿kvmkali)-[~]<br>
    └─$ nmap -sL tipcentos/24<br>
    ...<br>
    Nmap scan report for KvmKali (tipkali)<br>
    ...<br>
    Nmap scan report for kvmcentos (tipcentos)<br>
    ...<br>
    Nmap scan report for kvmubuntu (tipubuntu)<br>
    ...<br>
    4. Просканируем хост и проанализируем порт ftp. В некоторых случаях можно вытащить логин и пароль. Такое происходит, когда используются параметры входа по умолчанию.<br>
    [root@kvmcentos ~]# nmap -sV tipcentos<br>
    ...<br>
    PORT STATE SERVICE VERSION<br>
    21/tcp open ftp vsftpd 3.0.5<br>
    22/tcp open ssh OpenSSH 8.7 (protocol 2.0)<br>
    80/tcp open http nginx 1.22.1<br>
    3128/tcp open http-proxy Squid http proxy 5.5<br>
    ...<br>
    [root@kvmcentos ~]# nmap -sC tipcentos -p 21<br>
    ...<br>
    PORT STATE SERVICE<br>
    21/tcp open ftp<br>
    ...<br>
    root@aw:/# find /usr/share/nmap/scripts/ -name '*.nse' | grep ftp<br>
    ...<br>
    /usr/share/nmap/scripts/ftp-brute.nse<br>
    ...<br>
    root@aw:/# nmap --script-help ftp-brute.nse<br>
    ...<br>
    Performs brute force password auditing against FTP servers.<br>
    ...<br>
    [root@kvmcentos ~]# nmap --script ftp-brute.nse tipcentos -p 21<br>
    ...<br>
    PORT STATE SERVICE<br>
    21/tcp open ftp<br>
    | ftp-brute:<br>
    | Accounts: No valid accounts found<br>
    | Statistics: Performed 324 guesses in 642 seconds, average tps: 7.5<br>
    |_ ERROR: The service seems to have failed or is heavily firewalled...<br>
    ...<br>
    5. Сканируем диапазон портов.<br>
    ┌──(tuser㉿kvmkali)-[~]<br>
    └─$ nmap -sT -p 21-80 tipcentos<br>
    ...<br>
    PORT STATE SERVICE<br>
    21/tcp open ftp<br>
    22/tcp open ssh<br>
    25/tcp closed smtp<br>
    53/tcp closed domain<br>
    6. Просканируем удаленный хост (агрессивный режим).<br>
    ┌──(tuser㉿kvmkali)-[~]<br>
    └─$ nmap -A -T4 tipcentos<br>
    ...<br>
    PORT STATE SERVICE VERSION<br>
    20/tcp closed ftp-data<br>
    21/tcp open ftp vsftpd 3.0.5<br>
    22/tcp open ssh OpenSSH 8.7 (protocol 2.0)<br>
    25/tcp closed smtp<br>
    53/tcp closed domain<br>
    143/tcp closed imap<br>
    443/tcp closed https<br>
    3128/tcp open http-proxy Squid http proxy 5.5<br>
    |_http-server-header: squid/5.5<br>
    |_http-title: ERROR: The requested URL could not be retrieved<br>
    MAC Address: tmaccentos (QEMU virtual NIC)<br>
    Aggressive OS guesses: Linux 2.6.32 - 3.13 (94%), Linux 2.6.22 - 2.6.36 (92%), Linux 3.10 (92%), Linux 3.10 - 4.11 (92%), Linux 2.6.39 (92%), Linux 2.6.32 (91%), Linux 3.2 - 4.9 (91%), Linux 2.6.32 - 3.10 (91%), Linux 2.6.18 (90%), Linux 3.16 - 4.6 (90%)<br>
    No exact OS matches for host (test conditions non-ideal).<br>
    Network Distance: 1 hop<br>
    Service Info: OS: Unix<br>
    TRACEROUTE<br>
    HOP RTT ADDRESS<br>
    1 0.83 ms tipcentos<br>
    OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .<br>
    Nmap done: 1 IP address (1 host up) scanned in 24.18 seconds<br>
    7. Перехватываем DNS-трафик между сервером и каким-нибудь узлом в сети.<br>
    ┌──(tuser㉿kvmkali)-[~]<br>
    └─$ nmap tipwindows12<br>
    ...<br>
    PORT STATE SERVICE<br>
    53/tcp open domain<br>
    80/tcp open http<br>
    443/tcp open https<br>
    ...<br>
    [root@kvmcentos ~]# tcpdump -i enp1s0 -n -nn -ttt 'host tipwindows12 and port 53'<br>
    8. Перехватываем весь трафик для MAC-адреса tmaccentos на сетевом интерфейсе enp1s0.<br>
    [root@kvmcentos ~]# ifconfig<br>
    enp1s0: flags=4163&lt;UP,BROADCAST,RUNNING,MULTICAST&gt; mtu 1500<br>
    ...<br>
    ether tmaccentos txqueuelen 1000 (Ethernet)<br>
    ...<br>
    [root@kvmcentos ~]# tcpdump -n -i enp1s0 "ether host tmaccentos"<br>
    ...<br>
    ┌──(tuser㉿kvmkali)-[~]<br>
    └─$ ssh tuser@tipcentos<br>
    [root@kvmcentos ~]# tcpdump -n -i enp1s0 "ether host tmaccentos"<br>
    ...<br>
    00:11:12.536934 IP tipcentos.58598 &gt; tipubuntu.22: Flags [.], ack 3730, win 501, options [nop,nop,TS val 3107339434 ecr 2462889902], length 0<br>
    00:11:12.586762 IP tipubuntu.22 &gt; tipcentos.58598: Flags [P.], seq 3730:3782, ack 2242, win 501, options [nop,nop,TS val 2462889993 ecr 3107339434], length 52<br>
    00:11:12.586838 IP tipubuntu.22 &gt; tipcentos.58598: Flags [P.], seq 3782:3898, ack 2242, win 501, options [nop,nop,TS val 2462889993 ecr 3107339434], length 116<br>
    00:11:12.588205 IP tipcentos.58598 &gt; tipubuntu.22: Flags [.], ack 3782, win 501, options [nop,nop,TS val 3107339485 ecr 2462889993], length 0<br>
    00:11:12.588207 IP tipcentos.58598 &gt; tipubuntu.22: Flags [.], ack 3898, win 501, options [nop,nop,TS val 3107339486 ecr 2462889993], length 0<br>
    9. Перехватываем только ICMP-пакеты.<br>
    [root@kvmcentos ~]# tcpdump -i enp1s0 -n -nn -ttt 'ip proto \icmp'<br>
    ...<br>
    ┌──(tuser㉿kvmkali)-[~]<br>
    └─$ ping tipcentos<br>
    ...<br>
    64 bytes from tipcentos: icmp_seq=1 ttl=64 time=0.692 ms<br>
    64 bytes from tipcentos: icmp_seq=2 ttl=64 time=0.764 ms<br>
    64 bytes from tipcentos: icmp_seq=3 ttl=64 time=0.868 ms<br>
    64 bytes from tipcentos: icmp_seq=4 ttl=64 time=1.01 ms<br>
    64 bytes from tipcentos: icmp_seq=5 ttl=64 time=1.13 ms<br>
    ^C<br>
    ...<br>
    [root@kvmcentos ~]# tcpdump -i enp1s0 -n -nn -ttt 'ip proto \icmp'<br>
    ...<br>
    00:00:00.000000 IP tipcentos &gt; tipubuntu: ICMP echo request, id 4, seq 1, length 64<br>
    00:00:00.000171 IP tipubuntu &gt; tipcentos: ICMP echo reply, id 4, seq 1, length 64<br>
    00:00:01.001145 IP tipcentos &gt; tipubuntu: ICMP echo request, id 4, seq 2, length 64<br>
    00:00:00.000077 IP tipubuntu &gt; tipcentos: ICMP echo reply, id 4, seq 2, length 64<br>
    00:00:01.001365 IP tipcentos &gt; tipubuntu: ICMP echo request, id 4, seq 3, length 64<br>
    00:00:00.000077 IP tipubuntu &gt; tipcentos: ICMP echo reply, id 4, seq 3, length 64<br>
    00:00:01.001375 IP tipcentos &gt; tipubuntu: ICMP echo request, id 4, seq 4, length 64<br>
    00:00:00.000077 IP tipubuntu &gt; tipcentos: ICMP echo reply, id 4, seq 4, length 64<br>
    00:00:01.001573 IP tipcentos &gt; tipubuntu: ICMP echo request, id 4, seq 5, length 64<br>
    00:00:00.000125 IP tipubuntu &gt; tipcentos: ICMP echo reply, id 4, seq 5, length 64<br>
    10. Перехватываем входящий трафик на порт 80. сохраняем статистику в файл my.log для первых 500 пакетов. Будет создан бинарный файл my.log.<br>
    [root@kvmcentos ~]# tcpdump -v -i enp1s0 dst port 80<br>
    ...<br>
    ┌──(tuser㉿kvmkali)-[~]<br>
    └─$ firefox tipcentos:80<br>
    [root@kvmcentos ~]# tcpdump -v -i enp1s0 dst port 80<br>
    ...<br>
    14:07:24.835633 IP (tos 0x0, ttl 64, id 15549, offset 0, flags [DF], proto TCP (6), length 60)<br>
    kvmcentos.45022 &gt; kvmubuntu.http: Flags [S], cksum 0x76d1 (incorrect -&gt; 0x9a90), seq 1076682845, win 64240, options [mss 1460,sackOK,TS val 3110711737 ecr 0,nop,wscale 7], length 0<br>
    14:07:24.836511 IP (tos 0x0, ttl 64, id 15550, offset 0, flags [DF], proto TCP (6), length 52)<br>
    kvmcentos.45022 &gt; kvmubuntu.http: Flags [.], cksum 0x76c9 (incorrect -&gt; 0x51b3), ack 2952605173, win 502, options [nop,nop,TS val 3110711738 ecr 3247231251], length 0<br>
    14:07:24.836838 IP (tos 0x0, ttl 64, id 15551, offset 0, flags [DF], proto TCP (6), length 412)<br>
    kvmcentos.45022 &gt; kvmubuntu.http: Flags [P.], cksum 0x7831 (incorrect -&gt; 0xb0a2), seq 0:360, ack 1, win 502, options [nop,nop,TS val 3110711739 ecr 3247231251], length 360: HTTP, length: 360<br>
    GET / HTTP/1.1<br>
    Host: tipubuntu<br>
    User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/115.0<br>
    Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8<br>
    Accept-Language: ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3<br>
    Accept-Encoding: gzip, deflate<br>
    Connection: keep-alive<br>
    Upgrade-Insecure-Requests: 1<br>
    14:07:24.844920 IP (tos 0x0, ttl 64, id 15552, offset 0, flags [DF], proto TCP (6), length 52)<br>
    kvmcentos.45022 &gt; kvmubuntu.http: Flags [.], cksum 0x76c9 (incorrect -&gt; 0x4285), ack 3522, win 489, options [nop,nop,TS val 3110711747 ecr 3247231260], length 0<br>
    14:07:29.846014 IP (tos 0x0, ttl 64, id 15553, offset 0, flags [DF], proto TCP (6), length 52)<br>
    kvmcentos.45022 &gt; kvmubuntu.http: Flags [F.], cksum 0x76c9 (incorrect -&gt; 0x2eef), seq 360, ack 3522, win 501, options [nop,nop,TS val 3110716748 ecr 3247231260], length 0<br>
    14:07:29.846795 IP (tos 0x0, ttl 64, id 15554, offset 0, flags [DF], proto TCP (6), length 52)<br>
    kvmcentos.45022 &gt; kvmubuntu.http: Flags [.], cksum 0x76c9 (incorrect -&gt; 0x1b63), ack 3523, win 501, options [nop,nop,TS val 3110716749 ecr 3247236262], length 0<br>
    [root@kvmcentos ~]# tcpdump -v -n -w my.log dst port 80 -c 500<br>
    ...<br>
    [root@kvmcentos ~]# ls my.log<br>
    my.log<br>
    [root@kvmcentos ~]# tcpdump -nr my.log | awk '{print root@aw:/#3}' | grep -oE '[0-9]{1,}\.[0-9]{1,}\.[0-9]{1,}\.[0-9]{1,}' | sort | uniq -c | sort -rn<br>
    reading from file my.log, link-type EN10MB (Ethernet), snapshot length 262144<br>
    dropped privs to tcpdump<br>
    6 tipkali<br>
    <strong>Source:</strong><br>
    # <a href="https://losst.ru/kak-polzovatsya-nmap-dlya-skanirovaniya-seti">https://losst.ru/kak-polzovatsya-nmap-dlya-skanirovaniya-seti</a><br>
    # <a href="https://blog.sedicomm.com/2016/12/16/iptables-ustanovka-i-nastrojka/?ysclid=ln3wplng53988958006#1">https://blog.sedicomm.com/2016/12/16/iptables-ustanovka-i-nastrojka/?ysclid=ln3wplng53988958006#1</a>
</p>
