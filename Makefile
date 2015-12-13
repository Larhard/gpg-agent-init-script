all:

install:
	@cp -rv src/* $(DESTDIR)/

uninstall:
	@cd src; find * -type f -exec rm -fv "$(DESTDIR)/{}" \;

clean:

.PHONY: install uninstall clean
