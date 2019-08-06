## jps-gentoo

An overlay containing ebuilds that can't be found on Gentoo's main portage tree. Focus on Finnish software. 

 - la-capitaine-icon-theme https://krourke.org/projects/art/la-capitaine-icon-theme
 - luv-icon-theme https://www.gnome-look.org/p/1193830/
 - voikko http://voikko.puimula.org/
 - yle-dl https://aajanki.github.io/yle-dl/index-en.html

### Installing
#### With eselect-repository
eselect repository enable jps-gentoo


#### With Layman
layman -a jps-gentoo


#### With repos.conf
*make a directory for overlays if you don't have one yet* 

mkdir /var/db/repos

cd /var/db/repos

git clone https://github.com/juippis/jps-gentoo.git

wget -O /etc/portage/repos.conf/jps-gentoo.conf https://raw.githubusercontent.com/juippis/jps-gentoo/master/jps-gentoo.conf

emerge --sync


### Contacting
IRC: Juippis @ Freenode is the fastest way. 

