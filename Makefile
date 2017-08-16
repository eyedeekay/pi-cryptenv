
DESTDIR = /
PREFIX = usr/local

XDIR = etc/X11

dummy:
	@echo

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/xsidle.sh $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/securelock $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/unlock-Desktop $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/unlock-Documents $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/unlock-Downloads $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/unlock-Mail $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/unlock-Messaging $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/unlock-Music $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/unlock-Notes $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/unlock-Pictures $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/unlock-Projects $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/unlock-Videos $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/unlock-ratox $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/lock-All $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/lock-Desktop $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/lock-Documents $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/lock-Downloads $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/lock-Mail $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/lock-Messaging $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/lock-Music $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/lock-Notes $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/lock-Pictures $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/lock-Projects $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/lock-Videos $(DESTDIR)$(PREFIX)/bin
	install $(PREFIX)/bin/lock-ratox $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(XDIR)/Xsession.d
	install $(XDIR)/Xsession.d/99xsidle $(DESTDIR)$(XDIR)/Xsession.d

checkscripts:
	shellcheck -x $(PREFIX)/bin/securelock | tee securelock.sh.check
	shellcheck -x $(PREFIX)/bin/xsidle.sh | tee xsidle.sh.check
	shellcheck -x $(XDIR)/Xsession.d/99xsidle | tee -a xsidle.sh.check
	shellcheck -x $(PREFIX)/bin/unlock-Desktop | tee desktop.sh.check
	shellcheck -x $(PREFIX)/bin/unlock-Documents | tee documents.sh.check
	shellcheck -x $(PREFIX)/bin/unlock-Downloads | tee downloads.sh.check
	shellcheck -x $(PREFIX)/bin/unlock-Mail | tee mail.sh.check
	shellcheck -x $(PREFIX)/bin/unlock-Messaging | tee messaging.sh.check
	shellcheck -x $(PREFIX)/bin/unlock-Music | tee music.sh.check
	shellcheck -x $(PREFIX)/bin/unlock-Notes | tee notes.sh.check
	shellcheck -x $(PREFIX)/bin/unlock-Pictures | tee pictures.sh.check
	shellcheck -x $(PREFIX)/bin/unlock-Projects | tee projects.sh.check
	shellcheck -x $(PREFIX)/bin/unlock-Videos | tee videos.sh.check
	shellcheck -x $(PREFIX)/bin/unlock-ratox | tee ratox.sh.check
	shellcheck -x $(PREFIX)/bin/lock-All | tee lockall.sh.check
	shellcheck -x $(PREFIX)/bin/lock-Desktop | tee -a desktop.sh.check
	shellcheck -x $(PREFIX)/bin/lock-Documents | tee -a documents.sh.check
	shellcheck -x $(PREFIX)/bin/lock-Downloads | tee -a downloads.sh.check
	shellcheck -x $(PREFIX)/bin/lock-Mail | tee -a mail.sh.check
	shellcheck -x $(PREFIX)/bin/lock-Messaging | tee -a messaging.sh.check
	shellcheck -x $(PREFIX)/bin/lock-Music | tee -a music.sh.check
	shellcheck -x $(PREFIX)/bin/lock-Notes | tee -a notes.sh.check
	shellcheck -x $(PREFIX)/bin/lock-Pictures | tee -a pictures.sh.check
	shellcheck -x $(PREFIX)/bin/lock-Projects | tee -a projects.sh.check
	shellcheck -x $(PREFIX)/bin/lock-Videos | tee -a videos.sh.check
	shellcheck -x $(PREFIX)/bin/lock-ratox | tee -a ratox.sh.check

checkclean:
	rm *.sh.check

dh-create:
	rm -rf ../pi-cryptenv*.* ./debian
	dh_make --createorig -c gpl3 -e problemsolver@openmailbox.org -p pi-cryptenv_0.1 -i -y
