## jps-gentoo

An overlay containing ebuilds that can't be found on Gentoo's main portage tree. Focus on Finnish software. 

 - ahoviewer https://github.com/ahodesuka/ahoviewer
 - brave web browser https://brave.com/
 - dash-to-panel Gnome-3 extension https://github.com/jderose9/dash-to-panel
 - deepin-gtk-theme https://www.deepin.org/en/dde/
 - fd https://github.com/sharkdp/fd
 - la-capitaine-icon-theme https://krourke.org/projects/art/la-capitaine-icon-theme
 - luv-icon-theme https://www.gnome-look.org/p/1193830/
 - mge-flatix-theme https://github.com/edskeye/MGE-Flatix-Theme
 - numix-gtk-theme https://github.com/numixproject/numix-gtk-theme
 - pf-sources https://pfactum.github.io/pf-kernel/
 - torrench https://github.com/kryptxy/torrench
 - urxvt-tabbedex https://github.com/mina86/urxvt-tabbedex
 - vcsi https://github.com/amietn/vcsi
 - voikko http://voikko.puimula.org/
 - yle-dl https://github.com/aajanki/yle-dl

### Installing
#### With Layman
layman -a jps-gentoo


#### With repos.conf
*make a directory for overlays if you don't have one yet* mkdir /var/lib/overlays

cd /var/lib/overlays

git clone https://github.com/juippis/jps-gentoo.git

wget -O /etc/portage/repos.conf/jps-gentoo.conf https://raw.githubusercontent.com/juippis/jps-gentoo/master/jps-gentoo.conf

*change the path to your overlay directory* vim /etc/portage/repos.conf/jps-gentoo.conf

emerge --sync


### Contacting
IRC: Juippis @ Freenode is the fastest way. 

