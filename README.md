## jps-gentoo

An overlay containing ebuilds that can't be found on Gentoo's main portage tree. Focus on Finnish software. 

 - ahoviewer https://github.com/ahodesuka/ahoviewer
 - komorebi https://github.com/iabem97/komorebi
 - pavucontrol-qt https://github.com/lxde/pavucontrol-qt
 - pf-sources https://pf.natalenko.name/
 - urxvt-tabbedex https://github.com/stepb/urxvt-tabbedex
 - vcsi https://github.com/amietn/vcsi
 - vivaldi stable https://www.vivaldi.com
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

### Staying in Vivaldi-stable channel
Gentoo's main portage tree includes ebuilds for Vivaldis various versions, but it gets bumped with weekly snapshots and ignores minor fixes for the stable channel. I'll focus on staying in the stable channel, providing those minor fixed versions when ever they are released. 

If you dislike following the -snapshot channel and would like to stay in the stable camp, add the following into your **/etc/portage/package.mask** :
> www-client/vivaldi\*::gentoo

Then issue

> emerge -av www-client/vivaldi::jps-gentoo

(and optionally *vivaldi-ffmpeg-codecs* as well)

Then keep updating your system regularly to follow the latest stable releases. 

### PF-kernel sources
I personally use [pf-kernel](https://pf.natalenko.name/) with [UKSM patch](http://kerneldedup.org/en/projects/uksm/), but the ebuilds in Gentoo's main portage tree are always behind, and don't include the UKSM patch. I don't upgrade kernel every time a new one is released, but I do upgrade it when major versions are out, or there are some severe fixes in the minor releases. I also have to wait for Nvidia's slow updates.  

### Contacting
IRC: Juippis @ Freenode is the fastest way. 

