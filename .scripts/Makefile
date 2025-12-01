PREFIX ?= /usr/local
BINDIR := $(PREFIX)/bin

install:
	mkdir -p $(BINDIR)
	install -m 755 ./prompt/prompt.sh $(BINDIR)/prompt
	install -m 755 ./cpp-commands/initialization.sh $(BINDIR)/cpp-init
	install -m 755 ./cpp-commands/editor.sh $(BINDIR)/cpp-edit

uninstall:
	rm -f $(BINDIR)/prompt
	rm -f $(BINDIR)/cpp-init
	rm -f $(BINDIR)/cpp-edit
