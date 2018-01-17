
dummy:
	@echo

install:
	install -m755 usr/local/bin/init-unlock /usr/local/bin/
	install -m755 usr/local/bin/xsidle.sh /usr/local/bin/
	install -m755 usr/local/bin/secure-lock /usr/local/bin/
	install -m755 usr/local/bin/unlock /usr/local/bin/
	install -m755 usr/local/bin/unlock-Desktop /usr/local/bin/
	install -m755 usr/local/bin/unlock-Documents /usr/local/bin/
	install -m755 usr/local/bin/unlock-Downloads /usr/local/bin/
	install -m755 usr/local/bin/unlock-Mail /usr/local/bin/
	install -m755 usr/local/bin/unlock-Messaging /usr/local/bin/
	install -m755 usr/local/bin/unlock-Music /usr/local/bin/
	install -m755 usr/local/bin/unlock-Notes /usr/local/bin/
	install -m755 usr/local/bin/unlock-Pictures /usr/local/bin/
	install -m755 usr/local/bin/unlock-Projects /usr/local/bin/
	install -m755 usr/local/bin/unlock-Videos /usr/local/bin/
	install -m755 usr/local/bin/unlock-ratox /usr/local/bin/
	install -m755 usr/local/bin/lock /usr/local/bin/
	install -m755 usr/local/bin/lock-All /usr/local/bin/
	install -m755 usr/local/bin/lock-Desktop /usr/local/bin/
	install -m755 usr/local/bin/lock-Documents /usr/local/bin/
	install -m755 usr/local/bin/lock-Downloads /usr/local/bin/
	install -m755 usr/local/bin/lock-Mail /usr/local/bin/
	install -m755 usr/local/bin/lock-Messaging /usr/local/bin/
	install -m755 usr/local/bin/lock-Music /usr/local/bin/
	install -m755 usr/local/bin/lock-Notes /usr/local/bin/
	install -m755 usr/local/bin/lock-Pictures /usr/local/bin/
	install -m755 usr/local/bin/lock-Projects /usr/local/bin/
	install -m755 usr/local/bin/lock-Videos /usr/local/bin/
	install -m755 usr/local/bin/lock-ratox /usr/local/bin/
	mkdir -p /etc/postinstall/
	install etc/postinstall/home-defaults /etc/postinstall/home-defaults
	install -m755 etc/X11/Xsession.d/99xsidle /etc/X11/Xsession.d

checkscripts:
	shellcheck -x usr/local/bin/securelock | tee securelock.sh.check
	shellcheck -x usr/local/bin/xsidle.sh | tee xsidle.sh.check
	shellcheck -x etc/X11/Xsession.d/99xsidle | tee -a xsidle.sh.check
	shellcheck -x usr/local/bin/unlock | tee unlock.sh.check
	shellcheck -x usr/local/bin/unlock-Desktop | tee desktop.sh.check
	shellcheck -x usr/local/bin/unlock-Documents | tee documents.sh.check
	shellcheck -x usr/local/bin/unlock-Downloads | tee downloads.sh.check
	shellcheck -x usr/local/bin/unlock-Mail | tee mail.sh.check
	shellcheck -x usr/local/bin/unlock-Messaging | tee messaging.sh.check
	shellcheck -x usr/local/bin/unlock-Music | tee music.sh.check
	shellcheck -x usr/local/bin/unlock-Notes | tee notes.sh.check
	shellcheck -x usr/local/bin/unlock-Pictures | tee pictures.sh.check
	shellcheck -x usr/local/bin/unlock-Projects | tee projects.sh.check
	shellcheck -x usr/local/bin/unlock-Videos | tee videos.sh.check
	shellcheck -x usr/local/bin/unlock-ratox | tee ratox.sh.check
	shellcheck -x usr/local/bin/lock | tee lock.sh.check
	shellcheck -x usr/local/bin/lock-All | tee lockall.sh.check
	shellcheck -x usr/local/bin/lock-Desktop | tee -a desktop.sh.check
	shellcheck -x usr/local/bin/lock-Documents | tee -a documents.sh.check
	shellcheck -x usr/local/bin/lock-Downloads | tee -a downloads.sh.check
	shellcheck -x usr/local/bin/lock-Mail | tee -a mail.sh.check
	shellcheck -x usr/local/bin/lock-Messaging | tee -a messaging.sh.check
	shellcheck -x usr/local/bin/lock-Music | tee -a music.sh.check
	shellcheck -x usr/local/bin/lock-Notes | tee -a notes.sh.check
	shellcheck -x usr/local/bin/lock-Pictures | tee -a pictures.sh.check
	shellcheck -x usr/local/bin/lock-Projects | tee -a projects.sh.check
	shellcheck -x usr/local/bin/lock-Videos | tee -a videos.sh.check
	shellcheck -x usr/local/bin/lock-ratox | tee -a ratox.sh.check

checkclean:
	rm *.sh.check

dh-create:
	rm -rf ../pi-cryptenv*.* ./debian
	dh_make --createorig -c gpl3 -e problemsolver@openmailbox.org -p pi-cryptenv_0.1 -i -y

deb-pkg:
	debuild -us -uc

deb:
	checkinstall --install=no --default --pkgname=pi-cryptenv --pkgversion=0.1 \
		--pkglicense=gpl3 --nodoc --maintainer=problemsolver@openmailbox.org \
		--pakdir ../ --backup=no

