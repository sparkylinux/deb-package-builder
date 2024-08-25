#!/bin/sh
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License as
#  published by the Free Software Foundation; either version 2 of the
#  License, or (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software Foundation,
#  Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA

if [ "$1" = "uninstall" ]; then
	rm -rf /etc/deb-package-builder
	rm -f /usr/bin/deb-package-builder
	#rm -f /usr/lib/sparkycenter/software/deb-package-builder.desktop
	rm -f /usr/share/applications/deb-package-builder.desktop
	rm -f /usr/share/menu/deb-package-builder
	rm -rf /usr/share/sparky/deb-package-builder
else
	if [ ! -d /etc/deb-package-builder/DEBIAN ]; then
		mkdir -p /etc/deb-package-builder/DEBIAN
	fi
	cp etc/* /etc/deb-package-builder/DEBIAN/
	cp bin/* /usr/bin/
	#if [ ! -d /usr/lib/sparkycenter/software ]; then
	#	mkdir -p /usr/lib/sparkycenter/software
	#fi
	#cp share/deb-package-builder.desktop /usr/lib/sparkycenter/software/
	cp share/deb-package-builder.desktop /usr/share/applications/
	cp share/deb-package-builder /usr/share/menu/
	if [ ! -d /usr/share/sparky/deb-package-builder ]; then
		mkdir -p /usr/share/sparky/deb-package-builder
	fi
	cp lang/* /usr/share/sparky/deb-package-builder/
fi
