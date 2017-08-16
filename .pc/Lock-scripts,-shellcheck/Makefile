
PREFIX = /usr/local

dummy:
	@echo

@install:
	@install usr/local/bin/unlock-Desktop $(DESTDIR)$(PREFIX)/bin/unlock-Desktop
	@install usr/local/bin/unlock-Documents $(DESTDIR)$(PREFIX)/bin/unlock-Documents
	@install usr/local/bin/unlock-Downloads $(DESTDIR)$(PREFIX)/bin/unlock-Downloads
	@install usr/local/bin/unlock-Mail $(DESTDIR)$(PREFIX)/bin/unlock-Mail
	@install usr/local/bin/unlock-Messaging $(DESTDIR)$(PREFIX)/bin/unlock-Messaging
	@install usr/local/bin/unlock-Music $(DESTDIR)$(PREFIX)/bin/unlock-Music
	@install usr/local/bin/unlock-Notes $(DESTDIR)$(PREFIX)/bin/unlock-Notes
	@install usr/local/bin/unlock-Pictures $(DESTDIR)$(PREFIX)/bin/unlock-Pictures
	@install usr/local/bin/unlock-Projects $(DESTDIR)$(PREFIX)/bin/unlock-Projects
	@install usr/local/bin/unlock-Videos $(DESTDIR)$(PREFIX)/bin/unlock-Videos
	@install usr/local/bin/unlock-ratox $(DESTDIR)$(PREFIX)/bin/unlock-ratox

dh-create:
	rm -rf ../pi-cryptenv*.* ./debian
	dh_make --createorig -c gpl3 -e problemsolver@openmailbox.org -p pi-cryptenv_0.1 -i -y

