## jps-gentoo

An overlay containing ebuilds that can't be found on Gentoo's main portage tree. Focus on Finnish software. 

 - ahoviewer https://github.com/ahodesuka/ahoviewer
 - brave web browser https://brave.com/
 - dash-to-panel Gnome-3 extension https://github.com/jderose9/dash-to-panel
 - komorebi https://github.com/iabem97/komorebi
 - mge-flatix-theme https://github.com/edskeye/MGE-Flatix-Theme
 - nerd-fonts https://github.com/ryanoasis/nerd-fonts
 - pavucontrol-qt https://github.com/lxde/pavucontrol-qt
 - pf-sources https://pf.natalenko.name/
 - urxvt-tabbedex https://github.com/mina86/urxvt-tabbedex
 - vcsi https://github.com/amietn/vcsi
 - vivaldi-ffmpeg-codecs https://www.vivaldi.com
 - vivaldi-widevine https://www.vivaldi.com
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


### Proprietary codecs for Vivaldi web browser
vivaldi-ffmpeg-codecs

vivaldi-widevine

Keeping them up-to-date with the latest stable release of Vivaldi. 


### PF-kernel sources
Providing [pf-kernel](https://pf.natalenko.name/) with [UKSM patch](http://kerneldedup.org/en/projects/uksm/).
  

### Contacting
IRC: Juippis @ Freenode is the fastest way. 

