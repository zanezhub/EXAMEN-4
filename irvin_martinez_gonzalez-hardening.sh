#!/usr/bin/sh

# 1. Script should be able to indentify if the OS is Ubuntu or CentOS

# 2. It should install clamav antivirus. If the antivirus is already installed
# or running the script should stop and uninstall the software before installing a new one

# 3. Script should install EPEL repositories only for CentOS servers.

# 4. The script sould be capable to update all the packages having and avaible update in
# the repositories

# Clamav: clamav.net
# EPEL: docs.fedoraproject.org/en-US/epel/

OS=debian
if grep "$OS" /etc/os-release 1>/dev/null ; then
	echo "OS = Debian."
	if apt list --installed 2>/dev/null | grep clamav 2>/dev/null 1>&2 ; then
		echo "[-] Desinstalando clamav..."
		sudo apt purge clamav clamav-daemon
		clear && echo "[X] Clamav desinstalado."
	fi
	echo "[-] Instalando clamav..."
	sudo apt install clamav clamav-daemon
	clear && echo "[X] Clamav instalado."

	echo "[-] Actualizando paquetes..."
	sudo apt update && apt upgrade
else
	echo "CentOS"
fi
